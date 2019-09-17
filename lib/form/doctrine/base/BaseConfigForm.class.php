<?php

/**
 * Config form base class.
 * sfDoctrineFormGenerator 
 * @method Config getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
   
   
   
 
abstract class BaseConfigForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
       
            
            
              'id'               => new sfWidgetFormInputHidden(),
      
        
        
       
            
            
              'name'             => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'title'            => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'value'            => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'help'             => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'display'          => new sfWidgetFormChoice(array('choices' => array('user' => 'user', 'system' => 'system'))),
      
        
        
       
            
            
              'section'          => new sfWidgetFormChoice(array('choices' => array('settings' => 'settings', 'dictionary' => 'dictionary', 'system' => 'system', 'wiki' => 'wiki'))),
      
        
        
       
            
            
              'type'             => new sfWidgetFormChoice(array('choices' => array('integer' => 'integer', 'float' => 'float', 'boolean' => 'boolean', 'text' => 'text', 'enum' => 'enum'))),
      
        
        
       
            
            
              'type_enum_values' => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'use_wysiwyg'      => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'is_localized'     => new sfWidgetFormInputCheckbox(),
      
        
        
    ));

    $this->setValidators(array(
            
              'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'name'             => new sfValidatorString(array('max_length' => 255)),
                  
              'title'            => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'value'            => new sfValidatorString(array('required' => false)),
                  
              'help'             => new sfValidatorString(array('required' => false)),
                  
              'display'          => new sfValidatorChoice(array('choices' => array(0 => 'user', 1 => 'system'), 'required' => false)),
                  
              'section'          => new sfValidatorChoice(array('choices' => array(0 => 'settings', 1 => 'dictionary', 2 => 'system', 3 => 'wiki'), 'required' => false)),
                  
              'type'             => new sfValidatorChoice(array('choices' => array(0 => 'integer', 1 => 'float', 2 => 'boolean', 3 => 'text', 4 => 'enum'), 'required' => false)),
                  
              'type_enum_values' => new sfValidatorString(array('required' => false)),
                  
              'use_wysiwyg'      => new sfValidatorBoolean(array('required' => false)),
                  
              'is_localized'     => new sfValidatorBoolean(array('required' => false)),
          ));

    $this->widgetSchema->setNameFormat('config[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
           
           
     
         
  }

  public function getModelName()
  {
    return 'Config';
  }
    public function updateObject($values = null)
    {
        $object = parent::updateObject($values);
                return $object;
    }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();
    foreach($this->embeddedTextBlocks as $block_name){
        $TextBlock = Q::c('TextBlock', 'b')
            ->where('b.special_mark = ?', $block_name)
            ->fetchOne();
        if($TextBlock){
            $this->setDefault($block_name, $TextBlock->text);
        }
    }    
      }
  

  protected function doSave($con = null)
  {
    parent::doSave($con);
    
    foreach($this->embeddedTextBlocks as $block_name){
        $TextBlock = Q::c('TextBlock', 'b')
            ->where('b.special_mark = ?', $block_name)
            ->fetchOne();
        if($TextBlock){
            $TextBlock->text = $this->values[$block_name];
            $TextBlock->save();
        }
    }
  }



}
