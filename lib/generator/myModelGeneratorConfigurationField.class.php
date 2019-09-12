<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myModelGeneratorConfigurationField
 *
 * @author Алекс
 */
class myModelGeneratorConfigurationField extends sfModelGeneratorConfigurationField{
    
  static public function splitFieldWithFlag($field)
  {
    if (in_array($flag = $field[0], array('=', '_', '~', ';', '$')))
    {
      $field = substr($field, 1);
    }
    else
    {
      $flag = null;
    }

    return array($field, $flag);
  }
  
  public function setComponentListFormField($boolean)
  {
    $this->config['is_component_list_form_field'] = $boolean;
  }  
  
  public function isComponentListFormField()
  {
    return isset($this->config['is_component_list_form_field']) ? $this->config['is_component_list_form_field'] : false;
  }  
  
    public function setValueFormField($boolean)
  {
    $this->config['is_value_form_field'] = $boolean;
  } 
  public function isValueFormField()
  {
    return isset($this->config['is_value_form_field']) ? $this->config['is_value_form_field'] : false;  
  }

  /**
   * Sets a flag.
   *
   * The flag can be =, _, or ~.
   *
   * @param string $flag The flag
   */
  public function setFlag($flag)
  {
    if (null === $flag)
    {
      return;
    }

    switch ($flag)
    {
      case '=':
        $this->setLink(true);
        break;
      case '_':
        $this->setPartial(true);
        break;
      case '~':
        $this->setComponent(true);
        break;
      case ';':
        $this->setComponentListFormField(true);
        break;    
      case '$':
        $this->setValueFormField(true);
        break;       
      default:
        throw new InvalidArgumentException(sprintf('Flag "%s" does not exist.', $flag));
    }
  }

  /**
   * Gets the flag associated with the field.
   *
   * The flag will be
   *
   *   * = for a link
   *   * _ for a partial
   *   * ~ for a component
   *
   * @return string The flag
   */
  public function getFlag()
  {
    if ($this->isLink())
    {
      return '=';
    }
    else if ($this->isPartial())
    {
      return '_';
    }
    else if ($this->isComponent())
    {
      return '~';
    }
    else if ($this->isComponentListFormField())
    {
      return ';';
    }   
    else if ($this->isValueFormField())
    {
      return '$';
    }     

    return '';
  }
    
}
