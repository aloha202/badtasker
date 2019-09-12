<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myActions
 *
 * @author Алекс
 */
class myActions extends sfActions {

    protected function sendMessage($values, $subject = 'Contact Us message') {
        $to = MyConfig::get('administrator_email');
        $from = $values['email'];

        $body = $this->getPartial('email_message', $values);
        $headers = 'From: ' . $values['email'] . "\r\n" .
                'Reply-To: ' . $values['email'] . "\r\n" .
                'MIME-Version: 1.0' . "\r\n" .
                'Content-type: text/html; charset=utf-8' . "\r\n" .
                'X-Mailer: PHP/' . phpversion();

        @mail($to, $subject, $body, $headers);
    }

    protected function prepareModulePage($module_name) {
        $this->page = Doctrine::getTable('Page')->createQuery('p')
                ->where('p.is_module_page = ?', true)
                ->andWhere('p.module_name = ?', $module_name)
                ->fetchOne();
        if (!$this->page) {
            $this->page = new Page;
        }
    }

    protected function pageBySpecialMark($mark = '') {
        $q = Q::c('Page', 'p');
        if (!$mark) {
            $module = $this->getContext()->getModuleName();
            $action = $this->getContext()->getActionName();
            if ($action == 'index') {
                $q->where("p.special_mark = ? OR p.special_mark = ?", array(
                    sfInflector::underscore($module),
                    sfInflector::underscore($module) . '_index'
                ));
            } else {
                $q->where("p.special_mark = ?", sfInflector::underscore($module) . '_' . sfInflector::underscore($action));
            }
        } else {
            $q->where("p.special_mark = ?", $mark);
        }
        $page = $q->fetchOne();
        if (!$page) {
            $page = new Page;
        }
        return $page;
    }

    protected function pageByModuleAction() {
        return $this->pageBySpecialMark();
    }

    protected function redirectToSystemPage($special_mark) {
        $page = Doctrine::getTable('Page')
                ->findOneBySpecialMark($special_mark);
        if ($page) {
            return $this->redirect($this->generateUrl('page_show', $page));
        }
        return false;
    }

    protected function processForm2(sfForm $form, sfWebRequest $request, $message = 'Данные сохранены', $redirect = false) {
        if ($request->isMethod('post')) {
            $params = $request->getParameter($form->getName());
            $files = $request->getFiles($form->getName());
            $form->bind($params, $files);
            if ($form->isValid()) {
                $form->save();
                if ($request->isXmlHttpRequest()) {
                    return $this->renderText(json_encode(array(
                                        'content' => $message
                                    )));
                } else {
                    $this->getUser()->setFlash('notice', $message);                    
                    if($special_redirect = $this->getUser()->getProcessFormRedirect(get_class($form))){
                        return $this->redirect($special_redirect);
                    }
                    return $this->redirect($redirect ? $redirect : $request->getReferer());
                }
            }
        }
        return sfView::SUCCESS;
    }
    
    protected function processForm3(sfForm $form, sfWebRequest $request) {
        if ($request->isMethod('post')) {
            $params = $request->getParameter($form->getName());
            $files = $request->getFiles($form->getName());
            $form->bind($params, $files);
            if ($form->isValid()) {
                $result = $form->save();
                if($result){
                    $this->getUser()->setFlash('notice', $form->getNotice());
                }else{
                    $this->getUser()->setFlash('error', $form->getError());                    
                }
                return $this->redirect($request->getReferer());
                
            }
        }
        return sfView::SUCCESS;
    }    

    protected function renderXmlHttp() {
        return $this->renderPartial($this->getContext()->getActionName() . '_xmlhttp', $this->getVarHolder()->getAll());
    }

    protected function redirectXmlHttp($mod_action, sfWebRequest $request) {
        if ($request->isXmlHttpRequest()) {
            return $this->renderPartial($mod_action);
        } else {
            return $this->redirect($mod_action);
        }
    }

    protected function renderJson($array)
    {
        $this->getResponse()->setContentType('application/json');
        return $this->renderText(json_encode($array));
    }
    
    protected function renderJsonCommand($command, $param = true)
    {
        return $this->renderJson(array($command => $param));
    }

    public function getCart() {
        return $this->getContext()->getCart();
    }

    public function processPage($page = false, $replacements_object = null) {
        $request = sfContext::getInstance()->getRequest();
        if($special_page = $request->getParameter('special_page')){
            $page = $special_page;
        }else{
            if (!is_object($page)) {
                $page = $this->pageBySpecialMark($page);
            }
        }
        if ($page) {
            $this->getResponse()->setMeta($page, $replacements_object);
            $this->getContext()->set('global_header', $page->getName());
            if($page->getLayout()){
                $this->setLayout('layout_' . $page->getLayout());
            }            
            ProjectHelper::setPageActive($this->page);            
        } else {
            $page = new Page;
        }
        $this->page = $page;
        return $page;
    }
    
    public function displayPage()
    {
        $this->getRequest()->setParameter('__page', $this->page);
        $this->forward('page', 'show');
    }

}
