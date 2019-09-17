<?php

/**
 * Config filter form base class.
 *
 * @package    cms
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseConfigFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'             => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'title'            => new sfWidgetFormFilterInput(),
      'value'            => new sfWidgetFormFilterInput(),
      'help'             => new sfWidgetFormFilterInput(),
      'display'          => new sfWidgetFormChoice(array('choices' => array('' => '', 'user' => 'user', 'system' => 'system'))),
      'section'          => new sfWidgetFormChoice(array('choices' => array('' => '', 'settings' => 'settings', 'dictionary' => 'dictionary', 'system' => 'system', 'wiki' => 'wiki'))),
      'type'             => new sfWidgetFormChoice(array('choices' => array('' => '', 'integer' => 'integer', 'float' => 'float', 'boolean' => 'boolean', 'text' => 'text', 'enum' => 'enum'))),
      'type_enum_values' => new sfWidgetFormFilterInput(),
      'use_wysiwyg'      => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'is_localized'     => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
    ));

    $this->setValidators(array(
      'name'             => new sfValidatorPass(array('required' => false)),
      'title'            => new sfValidatorPass(array('required' => false)),
      'value'            => new sfValidatorPass(array('required' => false)),
      'help'             => new sfValidatorPass(array('required' => false)),
      'display'          => new sfValidatorChoice(array('required' => false, 'choices' => array('user' => 'user', 'system' => 'system'))),
      'section'          => new sfValidatorChoice(array('required' => false, 'choices' => array('settings' => 'settings', 'dictionary' => 'dictionary', 'system' => 'system', 'wiki' => 'wiki'))),
      'type'             => new sfValidatorChoice(array('required' => false, 'choices' => array('integer' => 'integer', 'float' => 'float', 'boolean' => 'boolean', 'text' => 'text', 'enum' => 'enum'))),
      'type_enum_values' => new sfValidatorPass(array('required' => false)),
      'use_wysiwyg'      => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'is_localized'     => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
    ));

    $this->widgetSchema->setNameFormat('config_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();
    $this->widgetSchema->setFormFormatterName('_Base');    

    parent::setup();
  }

  public function getModelName()
  {
    return 'Config';
  }

  public function getFields()
  {
    return array(
      'id'               => 'Number',
      'name'             => 'Text',
      'title'            => 'Text',
      'value'            => 'Text',
      'help'             => 'Text',
      'display'          => 'Enum',
      'section'          => 'Enum',
      'type'             => 'Enum',
      'type_enum_values' => 'Text',
      'use_wysiwyg'      => 'Boolean',
      'is_localized'     => 'Boolean',
    );
  }
}
