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
    }

}