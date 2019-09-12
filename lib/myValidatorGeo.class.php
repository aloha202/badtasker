<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myValidatorGeo
 *
 * @author Alaxa
 */
class myValidatorGeo extends sfValidatorBase{
    
  protected function doClean($values)
  {
      if($this->getOption('required')){
          if(empty($values['lat']) || empty($values['lng'])){
              throw new sfValidatorError($this, 'required');
          }
      }
      return $values;
  }    
    
}