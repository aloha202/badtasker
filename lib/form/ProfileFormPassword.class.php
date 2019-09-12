<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfilePasswordForm
 *
 * @author Алекс
 */
class ProfileFormPassword extends BasesfGuardUserForm {

    public function configure() {

        $this->useFields(array(
        ));

        $this->widgetSchema['old_password'] = new sfWidgetFormInputPassword;
        $this->widgetSchema['new_password'] = new sfWidgetFormInputPassword;
        $this->widgetSchema['new_password_again'] = new sfWidgetFormInputPassword;
        
        $this->validatorSchema['old_password'] = new sfValidatorString();
        $this->validatorSchema['new_password'] = new sfValidatorString();        
        $this->validatorSchema['new_password_again'] = new sfValidatorString();        

        $this->validatorSchema->setPostValidator(new sfGuardValidatorUserPassword());
        
        $labels = array(
            'old_password' => 'Старый пароль',
            'new_password' => 'Новый пароль',
            'new_password_again' => 'Новый пароль еще раз'
        );
        foreach($labels as $name => $value){
            $this->widgetSchema->setLabel($name, $value);
            $this->setRequired($name);
        }
        
        $this->widgetSchema->setFormFormatterName('bootstrap');
        

    }
    
    public function updateObject($values = null)
    {
        $object = parent::updateObject($values);
        $object->setPassword($this->values['new_password']);
        return $object;
    }

}
