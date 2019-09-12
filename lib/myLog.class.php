<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 2/7/18
 * Time: 20:37
 */
class myLog
{
    public static function write($text) {
        $log = '';

        $file = sfConfig::get('sf_cache_dir') . '/my_log.txt';
        if(file_exists($file)){
            $log = file_get_contents($file);
        }
        $log .= "\n" . $text;
        file_put_contents($file, $log);
    }
}