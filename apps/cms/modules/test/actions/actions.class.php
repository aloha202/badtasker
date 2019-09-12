<?php

/**
 * test actions.
 *
 * @package    cms
 * @subpackage test
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class testActions extends myActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function preExecute()
    {
        if(!$this->getContext()->isDeveloper()){
            return $this->redirect('@homepage');
        }
        //$this->setLayout('layout_2');
    }    
    public function executeIndex(sfWebRequest $request) {
        $this->forward('default', 'module');
    }

    public function executeSendmail(sfWebRequest $request) {
        $this->form = new TestFormSendmail;
        
        $this->processForm3($this->form, $request, false, 'test/sendmail');
    }

}
