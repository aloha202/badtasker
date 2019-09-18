<?php

/**
 * board actions.
 *
 * @package    cms
 * @subpackage board
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class boardActions extends sfActions
{
 /**
  * Executes index action
  *
  * @param sfRequest $request A request object
  */
  public function executeShow(sfWebRequest $request)
  {


        $this->Board = Q::c('Board', 'b')
            ->where('b.Users.id = ?', $this->getUser()->getGuardUser()->getId())
            ->andWhere('b.id = ?', $request->getParameter('id'))
            ->fetchOne()
            ;
        $this->forward404Unless($this->Board);


        $this->Tasks = Q::c('Task', 't')
            ->where('t.board_id = ?', $this->Board->id)
            ->andWhere('t.deadline >= ?', date('Y-m-d'))
            ->andWhere('t.status = ?', 'in_progress ')
            ->orderBy('t.deadline DESC')
            ->execute()
            ;
  }
}
