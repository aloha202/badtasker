<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SigninFormCms
 *
 * @author Alaxa
 */
class SigninFormCms extends sfGuardFormSignin{
	
	public function configure() {
		parent::configure();
		
		$this->widgetSchema->setFormFormatterName('lanceng');
	}
	
	
}