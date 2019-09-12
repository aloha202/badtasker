<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormColorPicker
 *
 * @author aradyuk
 */
class sfWidgetFormColorPicker extends sfWidgetForm{
    protected function configure($options = array(), $attributes = array()) {
        
    }
    
    public function render($name, $value = null, $attributes = array(), $errors = array()) {
        return "<div class='wColorPicker'>
            <input type='hidden' name='$name' value='$value' >
                <div class='display'></div>
        </div>";
    }
}
