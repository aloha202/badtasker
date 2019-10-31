<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 10/31/19
 * Time: 21:19
 */
class TaskFormDeadline extends TaskForm
{
    public function configure()
    {

        parent::configure();

        $this->useFields(['deadline']);

        $this->widgetSchema->setFormFormatterName('TableMy');

    }


    public function updateObject($values = null)
    {
        $object = parent::updateObject($values);

        $object->is_deadline_changed = true;

        return $object;
    }


    public function doSave($con = null)
    {
        parent::doSave($con);

        //notification
        MyNotificator::notify($this->getObject(), 'deadline_changed');
    }
}