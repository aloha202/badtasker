<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TestForm
 *
 * @author Alaxa
 */
class TestForm extends BaseForm{
    
    public function setup()
    {
        $this->setWidgets(array(
           'type' => new sfWidgetFormChoice(array('choices' => array(
               '' => ' ',
               'jur' => 'Я юр. лицо',
               'fiz' => 'Я физ. лицо'
           ))),
           'name' => new sfWidgetFormInputText,
            'email_address' => new sfWidgetFormInputText,
            'phone' => new sfWidgetFormInputText,
            'company_name' => new sfWidgetFormInputText,
            'company_phone' => new sfWidgetFormInputText,
            'company_inn' => new sfWidgetFormInputText,
            'company_address' => new sfWidgetFormInputText,
            'company_ceo_name' => new sfWidgetFormInputText,
            'is_subscribe' => new sfWidgetFormInputCheckbox,
            'subscribe_email' => new sfWidgetFormInputText
        ));
        
        $this->setValidators(array(
           'type' => new sfValidatorChoice(array('choices' => array(
               'jur', 'fiz'
           ))),
           'name' => new sfValidatorString(array('required' => true)),
            'email_address' => new sfValidatorString(array('required' => true)),
            'phone' => new sfValidatorString(array('required' => false)),
            'company_name' => new sfValidatorString(array('required' => true)),
            'company_phone' => new sfValidatorString(array('required' => true)),
            'company_inn' => new sfValidatorString(array('required' => true)),
            'company_address' => new sfValidatorString(array('required' => false)),
            'company_ceo_name' => new sfValidatorString(array('required' => false)),
            'is_subscribe' => new sfValidatorBoolean(array('required' => false)),
            'subscribe_email' => new sfValidatorEmail(array('required' => false))
        ));        
        
        $this->formatter('bootstrap');
        $this->widgetSchema->setNameFormat('test[%s]');
    }
    
    public function save()
    {
        return;
    }
    
}