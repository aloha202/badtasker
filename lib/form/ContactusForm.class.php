<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ContactusForm
 *
 * @author Алекс
 */
class ContactusForm extends SiteMessageForm{
    
    public function configure()
    {

        $this->widgetSchema->setFormFormatterName("bootstrap");
        
        $fields = array(
            'name' => 'Ваше имя', 'email' => 'Ваш Email', 'message' => 'Ваше сообщение'
        );
        $this->useFields(array_keys($fields));
        
        $this->setRequiredFields(array_keys($fields));
        $this->widgetSchema->setLabels($fields);
        
        $this->captcha('Введите код с картинки');        
        $this->validatorSchema['email'] = new sfValidatorEmail;
        
        $this->widgetSchema->setHelp('email', 'Нужен для обратной связи');
    }
    
    public function doSave($con = null)
    {
        parent::doSave($con);
        
        SiteEvent::fire('contactus_message', $this->getObject());
    }
    
    
    
}
