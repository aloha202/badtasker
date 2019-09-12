<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfValidatorDoctrineUniqueOrEmpty
 *
 * @author Алекс
 */
class sfValidatorDoctrineUniqueOrEmpty extends sfValidatorDoctrineUnique{

  protected function doClean($values)
  {
    $col = $this->getOption('column');
    if(!is_array($col)){
        $col = array($col);
    }
    $columns = array();
    foreach($col as $c){
        if(!empty($values[$c])){
            $columns[] = $c;
        }
    }
    if(!count($columns)){
        return $values;
    }
    
    $this->setOption('column', $col);
    
    return parent::doClean($values);

  }
}
