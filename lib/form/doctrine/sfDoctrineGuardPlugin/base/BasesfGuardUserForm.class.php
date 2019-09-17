<?php

/**
 * sfGuardUser form base class.
 * sfDoctrineFormGenerator 
 * @method sfGuardUser getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
   
   
   
 
abstract class BasesfGuardUserForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
       
            
            
              'id'               => new sfWidgetFormInputHidden(),
      
        
        
       
            
            
              'first_name'       => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'last_name'        => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'email_address'    => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'username'         => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'algorithm'        => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'salt'             => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'password'         => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'is_active'        => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'is_super_admin'   => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'last_login'       => new sfWidgetFormDateTime(),
      
        
        
       
            
            
              'lang'             => new sfWidgetFormChoice(array('choices' => array('en' => 'en', 'ru' => 'ru'))),
      
        
        
       
            
            
              'created_at'       => new sfWidgetFormDateTime(),
      
        
        
       
            
            
              'updated_at'       => new sfWidgetFormDateTime(),
      
        
        
      'groups_list'      => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardGroup')),
      'permissions_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardPermission')),
      'boards_list'      => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Board')),
    ));

    $this->setValidators(array(
            
              'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'first_name'       => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'last_name'        => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'email_address'    => new sfValidatorString(array('max_length' => 255)),
                  
              'username'         => new sfValidatorString(array('max_length' => 128)),
                  
              'algorithm'        => new sfValidatorString(array('max_length' => 128, 'required' => false)),
                  
              'salt'             => new sfValidatorString(array('max_length' => 128, 'required' => false)),
                  
              'password'         => new sfValidatorString(array('max_length' => 128, 'required' => false)),
                  
              'is_active'        => new sfValidatorBoolean(array('required' => false)),
                  
              'is_super_admin'   => new sfValidatorBoolean(array('required' => false)),
                  
              'last_login'       => new sfValidatorDateTime(array('required' => false)),
                  
              'lang'             => new sfValidatorChoice(array('choices' => array(0 => 'en', 1 => 'ru'), 'required' => false)),
                  
              'created_at'       => new sfValidatorDateTime(),
                  
              'updated_at'       => new sfValidatorDateTime(),
            'groups_list'      => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardGroup', 'required' => false)),
      'permissions_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardPermission', 'required' => false)),
      'boards_list'      => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Board', 'required' => false)),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorAnd(array(
        new sfValidatorDoctrineUnique(array('model' => 'sfGuardUser', 'column' => array('email_address'))),
        new sfValidatorDoctrineUnique(array('model' => 'sfGuardUser', 'column' => array('username'))),
      ))
    );

    $this->widgetSchema->setNameFormat('sf_guard_user[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
           
         unset($this['created_at'], $this['updated_at']);
           
     
         
  }

  public function getModelName()
  {
    return 'sfGuardUser';
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
        if (isset($this->widgetSchema['groups_list']))
    {
      $this->setDefault('groups_list', $this->object->Groups->getPrimaryKeys());
    }

    if (isset($this->widgetSchema['permissions_list']))
    {
      $this->setDefault('permissions_list', $this->object->Permissions->getPrimaryKeys());
    }

    if (isset($this->widgetSchema['boards_list']))
    {
      $this->setDefault('boards_list', $this->object->Boards->getPrimaryKeys());
    }

  }
  
  public function saveGroupsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['groups_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Groups->getPrimaryKeys();
    $values = $this->getValue('groups_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Groups', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Groups', array_values($link));
    }
  }

  public function savePermissionsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['permissions_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Permissions->getPrimaryKeys();
    $values = $this->getValue('permissions_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Permissions', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Permissions', array_values($link));
    }
  }

  public function saveBoardsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['boards_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Boards->getPrimaryKeys();
    $values = $this->getValue('boards_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Boards', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Boards', array_values($link));
    }
  }

  
  

  protected function doSave($con = null)
  {
    
    $this->saveGroupsList($con);
    $this->savePermissionsList($con);
    $this->saveBoardsList($con);
        
    
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
