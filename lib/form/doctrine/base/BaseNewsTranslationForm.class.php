<?php

/**
 * NewsTranslation form base class.
 * sfDoctrineFormGenerator 
 * @method NewsTranslation getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseNewsTranslationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
              'id'               => new sfWidgetFormInputHidden(),
      
        
        
              'title'            => new sfWidgetFormInputText(),
      
        
        
              'brief'            => new sfWidgetFormTextarea(),
      
        
        
              'content'          => new sfWidgetFormTextarea(),
      
        
        
              'meta_title'       => new sfWidgetFormInputText(),
      
        
        
              'meta_description' => new sfWidgetFormInputText(),
      
        
        
              'meta_keywords'    => new sfWidgetFormInputText(),
      
        
        
              'lang'             => new sfWidgetFormInputHidden(),
      
        
        
    ));

    $this->setValidators(array(
            
              'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'title'            => new sfValidatorString(array('max_length' => 255)),
                  
              'brief'            => new sfValidatorString(array('required' => false)),
                  
              'content'          => new sfValidatorString(array('required' => false)),
                  
              'meta_title'       => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'meta_description' => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'meta_keywords'    => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'lang'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('lang')), 'empty_value' => $this->getObject()->get('lang'), 'required' => false)),
          ));

    $this->widgetSchema->setNameFormat('news_translation[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
        
    $this->widgetSchema->setFormFormatterName('bootstrap');
  }

  public function getModelName()
  {
    return 'NewsTranslation';
  }

  
}
