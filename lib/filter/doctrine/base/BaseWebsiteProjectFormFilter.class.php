<?php

/**
 * WebsiteProject filter form base class.
 *
 * @package    cms
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseWebsiteProjectFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'website_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Website'), 'add_empty' => true)),
      'name'           => new sfWidgetFormFilterInput(),
      'codebase_type'  => new sfWidgetFormChoice(array('choices' => array('' => '', 'file' => 'file', 'input' => 'input'))),
      'codebase_file'  => new sfWidgetFormFilterInput(),
      'codebase_input' => new sfWidgetFormFilterInput(),
      'has_window'     => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'is_free'        => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'created_at'     => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'     => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'users_list'     => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUser')),
    ));

    $this->setValidators(array(
      'website_id'     => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Website'), 'column' => 'id')),
      'name'           => new sfValidatorPass(array('required' => false)),
      'codebase_type'  => new sfValidatorChoice(array('required' => false, 'choices' => array('file' => 'file', 'input' => 'input'))),
      'codebase_file'  => new sfValidatorPass(array('required' => false)),
      'codebase_input' => new sfValidatorPass(array('required' => false)),
      'has_window'     => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'is_free'        => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'created_at'     => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'     => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'users_list'     => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUser', 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('website_project_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();
    $this->widgetSchema->setFormFormatterName('_Base');    

    parent::setup();
  }

  public function addUsersListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query
      ->leftJoin($query->getRootAlias().'.WebsiteProject2sfGuardUser WebsiteProject2sfGuardUser')
      ->andWhereIn('WebsiteProject2sfGuardUser.sf_guard_user_id', $values)
    ;
  }

  public function getModelName()
  {
    return 'WebsiteProject';
  }

  public function getFields()
  {
    return array(
      'id'             => 'Number',
      'website_id'     => 'ForeignKey',
      'name'           => 'Text',
      'codebase_type'  => 'Enum',
      'codebase_file'  => 'Text',
      'codebase_input' => 'Text',
      'has_window'     => 'Boolean',
      'is_free'        => 'Boolean',
      'created_at'     => 'Date',
      'updated_at'     => 'Date',
      'users_list'     => 'ManyKey',
    );
  }
}
