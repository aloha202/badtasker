<?php

/**
 * WebsiteProject form base class.
 * sfDoctrineFormGenerator 
 * @method WebsiteProject getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
   
   
   
 
abstract class BaseWebsiteProjectForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
       
            
            
              'id'             => new sfWidgetFormInputHidden(),
      
        
        
       
            
            
              'website_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Website'), 'add_empty' => true)),
      
        
        
       
            
            
              'name'           => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'codebase_type'  => new sfWidgetFormChoice(array('choices' => array('file' => 'file', 'input' => 'input'))),
      
        
        
       
            
            
              'codebase_file'  => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'codebase_input' => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'has_window'     => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'is_free'        => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'created_at'     => new sfWidgetFormDateTime(),
      
        
        
       
            
            
              'updated_at'     => new sfWidgetFormDateTime(),
      
        
        
      'users_list'     => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUser')),
    ));

    $this->setValidators(array(
            
              'id'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'website_id'     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Website'), 'required' => false)),
                  
              'name'           => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'codebase_type'  => new sfValidatorChoice(array('choices' => array(0 => 'file', 1 => 'input'), 'required' => false)),
                  
              'codebase_file'  => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'codebase_input' => new sfValidatorString(array('required' => false)),
                  
              'has_window'     => new sfValidatorBoolean(array('required' => false)),
                  
              'is_free'        => new sfValidatorBoolean(array('required' => false)),
                  
              'created_at'     => new sfValidatorDateTime(),
                  
              'updated_at'     => new sfValidatorDateTime(),
            'users_list'     => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUser', 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('website_project[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
           
         unset($this['created_at'], $this['updated_at']);
           
     
         
  }

  public function getModelName()
  {
    return 'WebsiteProject';
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
        if (isset($this->widgetSchema['users_list']))
    {
      $this->setDefault('users_list', $this->object->Users->getPrimaryKeys());
    }

  }
  
  public function saveUsersList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['users_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Users->getPrimaryKeys();
    $values = $this->getValue('users_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Users', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Users', array_values($link));
    }
  }

  
  

  protected function doSave($con = null)
  {
    
    $this->saveUsersList($con);
        
    
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
