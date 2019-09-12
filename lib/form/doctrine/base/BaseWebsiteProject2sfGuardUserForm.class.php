<?php

/**
 * WebsiteProject2sfGuardUser form base class.
 * sfDoctrineFormGenerator 
 * @method WebsiteProject2sfGuardUser getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
   
   
   
 
abstract class BaseWebsiteProject2sfGuardUserForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
       
            
            
              'website_project_id' => new sfWidgetFormInputHidden(),
      
        
        
       
            
            
              'sf_guard_user_id'   => new sfWidgetFormInputHidden(),
      
        
        
    ));

    $this->setValidators(array(
            
              'website_project_id' => new sfValidatorChoice(array('choices' => array($this->getObject()->get('website_project_id')), 'empty_value' => $this->getObject()->get('website_project_id'), 'required' => false)),
                  
              'sf_guard_user_id'   => new sfValidatorChoice(array('choices' => array($this->getObject()->get('sf_guard_user_id')), 'empty_value' => $this->getObject()->get('sf_guard_user_id'), 'required' => false)),
          ));

    $this->widgetSchema->setNameFormat('website_project2sf_guard_user[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
           
           
     
         
  }

  public function getModelName()
  {
    return 'WebsiteProject2sfGuardUser';
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
