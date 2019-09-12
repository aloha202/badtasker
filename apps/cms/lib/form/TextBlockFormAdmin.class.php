<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TextBlockFormAdmin
 *
 * @author Администратор
 */
class TextBlockFormAdmin extends BaseTextBlockForm{
    
    public function configure() {
        $this->useFields(array(
           'name', 'text' 
        ));
        
        $this->noEditor(array('text'));
    }
    
}
