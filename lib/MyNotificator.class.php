<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 9/20/19
 * Time: 23:21
 */
class MyNotificator
{
    public static function notify($Task, $type){

        $Executer = $Task->getExecuter();
        $Responsible = $Task->getResponsible();
        $Creator = $Task->getUser();

        switch ($type){
            case 'created':

                if($Executer->getId() == $Responsible->getId()){
                    P::XMail($Executer->getEmailAddress(), 'Вам поставлена задача. Вы же являетесь ответственным', $Task->getName());
                }else {
                    P::XMail($Executer->getEmailAddress(), 'Вам поставлена задача', $Task->getName());
                    P::XMail($Responsible->getEmailAddress(), 'Вы ответственны по задаче', $Task->getName());
                }

                break;
            case 'finished':

                $message = $Task->getName() . '<br><i>' . $Task->getComment() . '</i>';
                if($Creator->getId() == $Responsible->getId()){
                    P::XMail($Responsible->getEmailAddress(), 'Задача выполнена. Наказание вам не грозит', $message);
                }else {
                    P::XMail($Creator->getEmailAddress(), 'Задача выполнена', $Task->getName());
                    P::XMail($Responsible->getEmailAddress(), 'Задача выполнена. Наказание вам не грозит', $message);
                }

                break;
        }


    }
}