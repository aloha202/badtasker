<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myWidgetFormProductAttributes
 *
 * @author Алекс
 */
class myWidgetFormProductAttributes extends sfWidgetForm{
    
    public function configure($options = array(), $attributes = array())
    {
        $this->addRequiredOption('product');
        parent::configure($options, $attributes);
    }
    
    public function render($name, $value = null, $attributes = array(), $errors = array())
    {
        return "helo";
        //return parent::render($name, $value, $attributes, $errors);
    }    
    
}
