<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BaseFormTest
 *
 * @author Alaxa
 */
class BaseFormTest extends BaseForm{
    protected $error = '';
    protected $notice = '';
    
    public function getError()
    {
        return $this->error;
    }
    public function getNotice()
    {
        return $this->notice;
    }    
}