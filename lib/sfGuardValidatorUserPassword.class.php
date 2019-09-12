<?php

class sfGuardValidatorUserPassword extends sfValidatorBase
{
  public function configure($options = array(), $messages = array())
  {
    $this->addOption('password_field', 'password');
    $this->addOption('throw_global_error', false);

    $this->setMessage('invalid', 'Password is invalid.');
  }

  protected function doClean($values)
  {
    $current_user = sfContext::getInstance()->getUser()->getGuardUser();
    $user = new sfGuardUser();
    $user->setSalt($current_user->getSalt());
    $user->setPassword($values['old_password']);
    if($user->getPassword() != $current_user->getPassword()){
        throw new sfValidatorErrorSchema($this, array('old_password' => new sfValidatorError($this, 'invalid')));
    }
    if($values['new_password'] != $values['new_password_again']){
        throw new sfValidatorErrorSchema($this, array('new_password' => new sfValidatorError($this, 'Passwords do not match')));
    }
    return $values;
    
  }

}