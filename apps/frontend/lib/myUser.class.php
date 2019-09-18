<?php

class myUser extends sfGuardSecurityUser
{

    public function isExecuter($Task)
    {
        return $Task->executer_id == $this->getGuardUser()->id;
    }

    public function isResponsible($Task)
    {
        return $Task->responsible_id == $this->getGuardUser()->id;
    }

}
