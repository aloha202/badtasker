<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 9/17/19
 * Time: 22:51
 */

class defaultComponents extends sfComponents
{

    public function executeHeader()
    {
        $this->Boards = $this->getUser()->getGuardUser()->getBoards();

        $this->Users = Q::c('sfGuardUser', 'u')->execute();

        $this->failed_count = [];
        foreach($this->Users as $User) {
            $this->failed_count[$User->getId()] = Q::c('Task', 't')
                ->where('t.responsible_id = ?', $User->getId())
                ->andWhere('t.status = ?', 'failed')
                ->count();
        }

    }

    public function executeLeft(){
        $this->Boards = $this->getUser()->getGuardUser()->getBoards();
    }

}