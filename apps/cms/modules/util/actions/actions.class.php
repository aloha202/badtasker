<?php

/**
 * util actions.
 *
 * @package    wes
 * @subpackage util
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class utilActions extends myActions
{
 /**
  * Executes index action
  *
  * @param sfRequest $request A request object
  */
  public function executeIndex(sfWebRequest $request)
  {
    $this->forward('default', 'module');
  }

    public function executeImageBuilderWidget(sfWebRequest $request)
    {
        
        $sModelName = $request->getParameter('model');
        if( !class_exists( $sModelName ) )
        {
            throw new Exception( 'Class ' . $sModelName . ' not found!' );
        }
                            
        $oModel = Doctrine::getTable($sModelName)->find(intval($request->getParameter('id')));
        
        if( !$oModel )
        {
            throw new Exception( 'Object from key ' . $request->getParameter('id') . 'is not retrieved!' );
        }
        if(method_exists($oModel, 'createThumb')){
            $oModel->createThumb( $request->getParameter('name'), $request->getParameter('x'), $request->getParameter('y'), $request->getParameter('scale', 1) );
        }else{
            ImageBuilderListener::createThumb($oModel, $request->getParameter('name'), $request->getParameter('x'), $request->getParameter('y'), $request->getParameter('scale', 1));
        }
        
        return $this->renderText('OK');
    }  
    
    public function executeConfigMenuCreatePage(sfWebRequest $request)
    {
        $val = $request->getParameter('value');
        
        $conf = Doctrine::getTable('Config')->findOneByName('menu_create_page');
        if($conf){
            $conf->setValue($val);
            $conf->save();
        }
        return sfView::NONE;
    }
    
    public function executeImageEdit(sfWebRequest $request)
    {
        $model = $this->model = $request->getParameter('model');
        $id = $this->id = $request->getParameter('id');
        $form_class = $request->getParameter('form_class', $model . 'Form');
        $this->object = Doctrine::getTable($model)->find($id);
        $this->form = new $form_class($this->object);
        $this->form->setFormFormatterName('backend');
        
        if($request->isMethod('post')){
            $this->form->bind($request->getParameter($this->form->getName()), $request->getFiles($this->form->getName()));
            if($this->form->isValid()){
                $this->form->save();
                $this->getUser()->setFlash('notice', 'Image updated');
                return $this->redirect($request->getReferer());
                return $this->renderText(json_encode(array(
                    'redirect' => $this->getController()->genUrl('util/imageEdit?id=' . $id . '&model=' . $model)
                )));
            }
        }
    }
    
    public function executeEmbeddedCollectionAddFields(sfWebRequest $request)
    {
        $attr = $request->getParameter('cur_module') . '_add_fields';
        $fields = $this->getUser()->getAttribute($attr, array());
        $fields[] = $request->getParameter('field');
        $this->getUser()->setAttribute($attr, $fields);
        return $this->renderText('ok');
    }
    
    public function executeAjaxFormValidator(sfWebRequest $request)
    {
        $form_class = $request->getParameter('form_class');
        $model = $request->getParameter('model');
        $model_id = $request->getParameter('model_id');
        $field_name = $request->getParameter('field_name');
        $field_value = $request->getParameter('field_value');
        
        $object = null;
        if($model_id){
            $object = Q::f($model, $model_id);
        }
        $form = new $form_class($object);
        //$form->disableLocalCSRFProtection(); 
        
        $form->useFields(array($field_name));
        
        $form->bind(array($field_name => $field_value, '_csrf_token' => $request->getParameter('csrf_token')));
        if($form->isValid()){
            return $this->renderJson(array('result' => 1));
        }
        $errors = $form->getAllErrors();
        $message =$errors[$field_name];
        return $this->renderJson(array('result' => 0, 'message' => $message));
    }    
}
