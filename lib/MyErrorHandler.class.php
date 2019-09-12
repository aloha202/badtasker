<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MyErrorHandler
 *
 * @author Alaxa
 */
class MyErrorHandler {
    
    public static function handleException(sfEvent $event)
    {

            $exception = $event->getSubject();
            Notifier::notify(500, $exception->getMessage(), $exception);
            /*
            $subj_message = $exception->getMessage();
            $message = $exception->__toString();
            $message .= "\n\n\n";
            $message .= print_r($_SERVER, 1);
            
            $message = nl2br($message);
            
            $subject = 'DostavkaTK - Ошибка на сайте. ' . $subj_message; 
            P::sendEmail('office@dostavka.tk', $subject, $message);
            P::sendEmail('alexey.radyuk@gmail.com', $subject, $message);            
        
             * 
             */
    }
    
}