<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Q
 *
 * @author Алекс
 */
class Q {

    public static function create($model, $a = 'a') {
        return Doctrine::getTable($model)
                        ->createQuery($a);
    }

    public static function find($model, $id) {
        return Doctrine::getTable($model)->find($id);
    }

    public static function c($model, $a = 'a') {
        return self::create($model, $a);
    }

    public static function f($model, $id) {
        return self::find($model, $id);
    }

}
