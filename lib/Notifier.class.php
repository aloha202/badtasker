<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Notifier
 *
 * @author Alaxa
 */
class Notifier {
    
    public static function notify($code, $message, $exception = null)
    {
        $dump = $exception ? $exception->__toString() : '';
        $dump .= "SERVER:\n";
        $dump .= print_r($_SERVER, 1);
        $dump .= "POST:\n";        
        $dump .= print_r($_POST, 1);        
        $dump .= "GET:\n";        
        $dump .= print_r($_GET, 1);        
        $dump .= "COOKIE:\n";        
        $dump .= print_r($_COOKIE, 1);        
        $params = array(
            'code' => $code,
            'message' => $message,
            'dump' => $dump,
            'project_name' => 'snob',
            'project_code' => 'snob'
        );
        myCurl::post('http://master.web375.org/api.php/notifier', $params);
    }
    
    
    
}