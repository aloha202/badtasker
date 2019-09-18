<?php

/**
 * task actions.
 *
 * @package    cms
 * @subpackage task
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class taskActions extends sfActions
{
 /**
  * Executes index action
  *
  * @param sfRequest $request A request object
  */
  public function executeCreate(sfWebRequest $request)
  {

      $this->form = new TaskFormFront();

      $this->processForm($this->form, $request);

  }

  public function executeFinished(sfWebRequest $request)
  {

        $this->Task = Q::c('Task', 't')
            ->where('t.id = ?', $request->getParameter('id'))
            ->fetchOne()
            ;

        $this->forward404Unless($this->Task && $this->Task->executer_id == $this->getUser()->getGuardUser()->id);

        $this->form = new TaskFormFinish($this->Task);

        $this->processForm($this->form, $request);

  }

  protected function processForm($form, $request)
  {
      if($request->isMethod('post')){

          $form->bind($request->getParameter($form->getName()));

          if($form->isValid()){

              $form->save();

              return $this->redirect('@board_show?id=' . $form->getObject()->board_id);

          }

      }
  }


}
