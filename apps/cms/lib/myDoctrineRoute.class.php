<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 1/24/18
 * Time: 12:46
 */
class myDoctrineRoute extends sfDoctrineRoute{

    public function getObject() {
        $object = parent::getObject();

        $user = sfContext::getInstance()->getUser()->getGuardUser();
        if($user->getId() != $object->getUserId()){
            throw new sfError404Exception(sprintf('The %s object[%s] is not available for current user[%s]', $this->options['model'], $object->getId(), $user->getId()));
        }

        return $object;

    }

}
{

}