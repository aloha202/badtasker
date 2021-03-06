<?php

/**
 * BasePunishmentPreset
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * 
 * @method string           getName() Returns the current record's "name" value
 * @method PunishmentPreset setName() Sets the current record's "name" value
 * 
 * @package    cms
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasePunishmentPreset extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('punishment_preset');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        
    }
}