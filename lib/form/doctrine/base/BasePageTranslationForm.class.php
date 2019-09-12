<?php

/**
 * PageTranslation form base class.
 * sfDoctrineFormGenerator 
 * @method PageTranslation getObject() Returns the current form's model object
 *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePageTranslationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
              'id'               => new sfWidgetFormInputHidden(),
                    'name'             => new sfWidgetFormInputText(),
                    'content'          => new sfWidgetFormTextarea(),
                    'meta_title'       => new sfWidgetFormInputText(),
                    'meta_description' => new sfWidgetFormInputText(),
                    'meta_keywords'    => new sfWidgetFormInputText(),
                    'lang'             => new sfWidgetFormInputHidden(),
          ));

    $this->setValidators(array(
            
              'id'               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
                  
              'name'             => new sfValidatorString(array('max_length' => 255)),
                  
              'content'          => new sfValidatorString(array('required' => false)),
                  
              'meta_title'       => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'meta_description' => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'meta_keywords'    => new sfValidatorString(array('max_length' => 255, 'required' => false)),
                  
              'lang'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('lang')), 'empty_value' => $this->getObject()->get('lang'), 'required' => false)),
          ));

    $this->widgetSchema->setNameFormat('page_translation[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'PageTranslation';
  }

}
