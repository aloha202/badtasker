<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormSchemaFormatterTableMy
 *
 * @author Алекс
 */
class sfWidgetFormSchemaFormatterTableMy extends sfWidgetFormSchemaFormatterTable{
    
  public function generateLabel($name, $attributes = array())
  {
    $labelName = $this->generateLabelName($name);

    if (false === $labelName)
    {
      return '';
    }

    if (!isset($attributes['for']))
    {
      $attributes['for'] = $this->widgetSchema->generateId($this->widgetSchema->generateName($name));
    }
    $req = '';
    if($this->widgetSchema[$name]->getAttribute('required') || $this->widgetSchema[$name]->getAttribute('required_field')){
        $req .= '<span class="req">*</span>';
    }

    return $this->widgetSchema->renderContentTag('label', $labelName, $attributes) . $req;
  }    
    
}
