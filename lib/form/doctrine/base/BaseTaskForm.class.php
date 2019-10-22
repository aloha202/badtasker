<?php

/**
 * Task form base class.
 * sfDoctrineFormGenerator 
 * @method Task getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
   
   
   
 
abstract class BaseTaskForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
       
            
            
              'id'                  => new sfWidgetFormInputHidden(),
      
        
        
       
            
            
              'board_id'            => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Board'), 'add_empty' => false)),
      
        
        
       
            
            
              'executer_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Executer'), 'add_empty' => false)),
      
        
        
       
            
            
              'responsible_id'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Responsible'), 'add_empty' => false)),
      
        
        
       
            
            
              'name'                => new sfWidgetFormInputText(),
      
        
        
       
            
            
              'description'         => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'deadline'            => new sfWidgetFormDate(),
      
        
        
       
            
            
              'punishment'          => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'status'              => new sfWidgetFormChoice(array('choices' => array('in_progress' => 'in_progress', 'done' => 'done', 'failed' => 'failed', 'archived' => 'archived'))),
      
        
        
       
            
            
              'comment'             => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'is_failed'           => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'punishment_comment'  => new sfWidgetFormTextarea(),
      
        
        
       
            
            
              'is_deadline_changed' => new sfWidgetFormInputCheckbox(),
      
        
        
       
            
            
              'created_at'          => new sfWidgetFormDateTime(),
      
        
        
       
            
            
              'updated_at'          => new sfWidgetFormDateTime(),
      
        
        
       
            
            
              'user_id'             => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('User'), 'add_empty' => true)),
      
        
        
    ));

    $this->setValidators(array(
            
              'id'                  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'board_id'            => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Board'))),
                  
              'executer_id'         => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Executer'))),
                  
              'responsible_id'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Responsible'))),
                  
              'name'                => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'description'         => new sfValidatorString(array('required' => false)),
                  
              'deadline'            => new sfValidatorDate(array('required' => false)),
                  
              'punishment'          => new sfValidatorString(array('required' => false)),
                  
              'status'              => new sfValidatorChoice(array('choices' => array(0 => 'in_progress', 1 => 'done', 2 => 'failed', 3 => 'archived'), 'required' => false)),
                  
              'comment'             => new sfValidatorString(array('required' => false)),
                  
              'is_failed'           => new sfValidatorBoolean(array('required' => false)),
                  
              'punishment_comment'  => new sfValidatorString(array('required' => false)),
                  
              'is_deadline_changed' => new sfValidatorBoolean(array('required' => false)),
                  
              'created_at'          => new sfValidatorDateTime(),
                  
              'updated_at'          => new sfValidatorDateTime(),
                  
              'user_id'             => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('User'), 'required' => false)),
          ));

    $this->widgetSchema->setNameFormat('task[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
           
         unset($this['created_at'], $this['updated_at']);
           
     
         
  }

  public function getModelName()
  {
    return 'Task';
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
