<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SinginForm
 *
 * @author Алекс
 */
class SigninForm extends sfGuardFormSignin {

	public function configure() {
		$this->widgetSchema->setFormFormatterName('Bootstrap2');

		$this->widgetSchema->setLabel('remember', 'Запомнить меня на этом компьютере');
		$this->widgetSchema->setLabel('username', 'Логин (Ваш Email)');



		$this->setDefault('remember', true);
	}
	
	public function updateDefaultsFromObject() {
		parent::updateDefaultsFromObject();
	}

}
