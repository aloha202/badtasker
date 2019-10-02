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
                $message = $Task->getName() . '<br><i>' . $Task->getComment() . '</i><br>';
                $message .= "Deadline: <strong>" . date('d.m.Y', strtotime($Task->deadline)) . "</strong>";
                if($Executer->getId() == $Responsible->getId()){
                    P::XMail($Executer->getEmailAddress(), 'Вам поставлена задача ' . $Task->getName() . '. Вы же являетесь ответственным', $message);
                }else {
                    P::XMail($Executer->getEmailAddress(), 'Вам поставлена задача', $Task->getName());
                    P::XMail($Responsible->getEmailAddress(), 'Вы ответственны по задаче', $Task->getName());
                }

                break;
            case 'finished':
                $subject = "Задача " . $Task->getName() . "выполнена";
                $message = $Task->getName() . '<br><i>' . $Task->getComment() . '</i>';
                if($Creator->getId() == $Responsible->getId()){
                    P::XMail($Responsible->getEmailAddress(), $subject, $message);
                }else {
                    P::XMail($Creator->getEmailAddress(), $subject, $message);
                    P::XMail($Responsible->getEmailAddress(), $subject, $message);
                }

                break;

            case 'failed':
                $subject = "Задача " . $Task->getName() . "провалена";
                $message = $Task->getName() . '<br><i>' . $Task->getDescription() . '</i>';
                $message .= "<br><strong style='color: red'>Задача провалена</strong><br >";
                $messageResponsible = $message .  "Вас ожидает наказание: " . $Task->getPunishment();
                $messageOwner = $message . "Пользователя " . $Responsible->getUsername() . ' ожидает наказание: ' . $Task->getPunishment();
                if($Creator->getId() == $Responsible->getId()){
                    P::XMail($Responsible->getEmailAddress(), $subject, $messageResponsible);
                }else{
                    P::XMail($Responsible->getEmailAddress(), $subject, $messageResponsible);
                    P::XMail($Creator->getEmailAddress(), $subject, $messageOwner);
                }
                break;
        }


    }
}