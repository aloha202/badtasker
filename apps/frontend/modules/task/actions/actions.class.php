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

      $this->presets = Q::c('PunishmentPreset')->execute();

  }


  public function executeFailed(sfWebRequest $request)
  {

      if($request->getParameter('id')) {
          $this->User = Q::f('sfGuardUser', $request->getParameter('id'));
      }else{
          $this->User = $this->getUser()->getGuardUser();
      }
        $this->Tasks = Q::c('Task', 't')
            ->where('t.responsible_id = ?', $this->User->getId())
            ->andWhere('t.status = ?', 'failed')
            ->orderBy('t.deadline DESC')
            ->execute();


  }

  public function executeArchive(sfWebRequest $request)
  {
      $this->Tasks = Q::c('Task', 't')
          ->where('t.responsible_id = ?', $this->getUser()->getGuardUser()->getId())
          ->andWhereIn('t.status', ['archived', 'done'])
          ->orderBy('t.deadline DESC')
          ->execute();
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

  public function executePunishment(sfWebRequest $request)
  {
      $this->Task = Q::c('Task', 't')
          ->where('t.id = ?', $request->getParameter('id'))
          ->fetchOne()
      ;

      $this->forward404Unless($this->Task &&
          $this->Task->status == 'failed' &&
          ($this->Task->responsible_id == $this->getUser()->getGuardUser()->id ||
              $this->Task->user_id == $this->getUser()->getGuardUser()->id)
          );

      $this->form = new TaskFormPunishment($this->Task);


      $this->processForm($this->form, $request, 'task/failed?id=' . $this->Task->responsible_id);
  }

  public function executeDeadline(sfWebRequest $request){
      $this->Task = Q::c('Task', 't')
          ->where('t.id = ?', $request->getParameter('id'))
          ->fetchOne()
      ;

      $this->forward404Unless($this->Task &&
          !$this->Task->is_deadline_changed &&
          $this->Task->status == 'in_progress' &&
          $this->Task->user_id == $this->getUser()->getGuardUser()->id
      );

      $this->form = new TaskFormDeadline($this->Task);


      $this->processForm($this->form, $request);
  }


  public function executeReminder(sfWebRequest $request)
  {
      $Task = Q::c('Task', 't')
          ->where('t.id = ?', $request->getParameter('id'))
          ->fetchOne()
      ;

      MyNotificator::notify($Task, 'reminder');

      $this->getUser()->setFlash('notice', 'Исполнитель задачи пнут успешно');

      return $this->redirect($request->getReferer());
  }

  protected function processForm($form, $request, $redirect = null)
  {
      if($request->isMethod('post')){

          $form->bind($request->getParameter($form->getName()));

          if($form->isValid()){

              $form->save();

              return $this->redirect($redirect ? $redirect : '@board_show?id=' . $form->getObject()->board_id);

          }

      }
  }


}
