<?php

/**
 * BaseBoard
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property Doctrine_Collection $Users
 * @property Doctrine_Collection $Board2User
 * @property Doctrine_Collection $Tasks
 * 
 * @method string              getName()       Returns the current record's "name" value
 * @method Doctrine_Collection getUsers()      Returns the current record's "Users" collection
 * @method Doctrine_Collection getBoard2User() Returns the current record's "Board2User" collection
 * @method Doctrine_Collection getTasks()      Returns the current record's "Tasks" collection
 * @method Board               setName()       Sets the current record's "name" value
 * @method Board               setUsers()      Sets the current record's "Users" collection
 * @method Board               setBoard2User() Sets the current record's "Board2User" collection
 * @method Board               setTasks()      Sets the current record's "Tasks" collection
 * 
 * @package    cms
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseBoard extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('board');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('sfGuardUser as Users', array(
             'refClass' => 'Board2User',
             'local' => 'board_id',
             'foreign' => 'user_id'));

        $this->hasMany('Board2User', array(
             'local' => 'id',
             'foreign' => 'board_id'));

        $this->hasMany('Task as Tasks', array(
             'local' => 'id',
             'foreign' => 'board_id'));
    }
}