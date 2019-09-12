<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TestFormSendmail
 *
 * @author Alaxa
 */
class TestFormSendmail extends BaseFormTest{
    

    public function setup()
    {
        $this->widgetSchema['to'] = new sfWidgetFormInputText;
        $this->validatorSchema['to'] = new sfValidatorEmail;
        
        $this->widgetSchema['subject'] = new sfWidgetFormInputText;
        $this->validatorSchema['subject'] = new sfValidatorString;        
        
        $this->widgetSchema['body'] = new sfWidgetFormTextarea;
        $this->validatorSchema['body'] = new sfValidatorString;                
        
        $this->widgetSchema->setNameFormat('sendmail[%s]');
        
        $this->widgetSchema->setFormFormatterName('backend');
    }
    
    public function save()
    {
        $res = P::XMail($this->values['to'], $this->values['subject'], $this->values['body']);
        if($res){
            $this->notice = 'Message sent';
        }else{
            $this->error = 'Could not send message';            
        }
        return $res;
    }
    
}