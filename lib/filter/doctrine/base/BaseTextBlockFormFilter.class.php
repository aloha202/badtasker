<?php

/**
 * TextBlock filter form base class.
 *
 * @package    cms
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseTextBlockFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'                 => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'title'                => new sfWidgetFormFilterInput(),
      'application'          => new sfWidgetFormFilterInput(),
      'module'               => new sfWidgetFormFilterInput(),
      'special_mark'         => new sfWidgetFormFilterInput(),
      'is_visible_for_admin' => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
    ));

    $this->setValidators(array(
      'name'                 => new sfValidatorPass(array('required' => false)),
      'title'                => new sfValidatorPass(array('required' => false)),
      'application'          => new sfValidatorPass(array('required' => false)),
      'module'               => new sfValidatorPass(array('required' => false)),
      'special_mark'         => new sfValidatorPass(array('required' => false)),
      'is_visible_for_admin' => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
    ));

    $this->widgetSchema->setNameFormat('text_block_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();
    $this->widgetSchema->setFormFormatterName('_Base');    

    parent::setup();
  }

  public function getModelName()
  {
    return 'TextBlock';
  }

  public function getFields()
  {
    return array(
      'id'                   => 'Number',
      'name'                 => 'Text',
      'title'                => 'Text',
      'application'          => 'Text',
      'module'               => 'Text',
      'special_mark'         => 'Text',
      'is_visible_for_admin' => 'Boolean',
    );
  }
}
