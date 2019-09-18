<?php

/**
 * Task filter form base class.
 *
 * @package    cms
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseTaskFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'board_id'       => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Board'), 'add_empty' => true)),
      'executer_id'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Executer'), 'add_empty' => true)),
      'responsible_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Responsible'), 'add_empty' => true)),
      'name'           => new sfWidgetFormFilterInput(),
      'description'    => new sfWidgetFormFilterInput(),
      'deadline'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
      'punishment'     => new sfWidgetFormFilterInput(),
      'status'         => new sfWidgetFormChoice(array('choices' => array('' => '', 'in_progress' => 'in_progress', 'done' => 'done', 'failed' => 'failed'))),
      'comment'        => new sfWidgetFormFilterInput(),
      'created_at'     => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'     => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'user_id'        => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('User'), 'add_empty' => true)),
    ));

    $this->setValidators(array(
      'board_id'       => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Board'), 'column' => 'id')),
      'executer_id'    => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Executer'), 'column' => 'id')),
      'responsible_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Responsible'), 'column' => 'id')),
      'name'           => new sfValidatorPass(array('required' => false)),
      'description'    => new sfValidatorPass(array('required' => false)),
      'deadline'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDate(array('required' => false)), 'to_date' => new sfValidatorDateTime(array('required' => false)))),
      'punishment'     => new sfValidatorPass(array('required' => false)),
      'status'         => new sfValidatorChoice(array('required' => false, 'choices' => array('in_progress' => 'in_progress', 'done' => 'done', 'failed' => 'failed'))),
      'comment'        => new sfValidatorPass(array('required' => false)),
      'created_at'     => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'     => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'user_id'        => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('User'), 'column' => 'id')),
    ));

    $this->widgetSchema->setNameFormat('task_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();
    $this->widgetSchema->setFormFormatterName('_Base');    

    parent::setup();
  }

  public function getModelName()
  {
    return 'Task';
  }

  public function getFields()
  {
    return array(
      'id'             => 'Number',
      'board_id'       => 'ForeignKey',
      'executer_id'    => 'ForeignKey',
      'responsible_id' => 'ForeignKey',
      'name'           => 'Text',
      'description'    => 'Text',
      'deadline'       => 'Date',
      'punishment'     => 'Text',
      'status'         => 'Enum',
      'comment'        => 'Text',
      'created_at'     => 'Date',
      'updated_at'     => 'Date',
      'user_id'        => 'ForeignKey',
    );
  }
}
