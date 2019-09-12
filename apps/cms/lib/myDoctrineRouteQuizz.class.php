<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 1/24/18
 * Time: 12:46
 */
class myDoctrineRouteQuizz extends sfDoctrineRoute{

    public function getObject() {
        $object = parent::getObject();

        $Quizz = $object->getQuizz();

        $user = sfContext::getInstance()->getUser()->getGuardUser();
        if($user->getId() != $Quizz->getUserId()){
            throw new sfError404Exception(sprintf('The %s object[%s] is not available for current user[%s]', $this->options['model'], $object->getId(), $user->getId()));
        }

        return $object;

    }

}
{

}