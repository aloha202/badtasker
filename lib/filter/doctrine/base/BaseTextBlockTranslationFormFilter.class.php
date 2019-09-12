<?php

/**
 * TextBlockTranslation filter form base class.
 *
 * @package    cms
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseTextBlockTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'text' => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'text' => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('text_block_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();
    $this->widgetSchema->setFormFormatterName('_Base');    

    parent::setup();
  }

  public function getModelName()
  {
    return 'TextBlockTranslation';
  }

  public function getFields()
  {
    return array(
      'id'   => 'Number',
      'text' => 'Text',
      'lang' => 'Text',
    );
  }
}
