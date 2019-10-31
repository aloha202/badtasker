<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 9/18/19
 * Time: 11:02
 */
class TaskFormFront extends TaskForm
{


    public function configure()
    {
        parent::configure(); // TODO: Change the autogenerated stub

        unset($this['user_id'], $this['status'], $this['comment'], $this['punishment_comment'],
            $this['is_failed'], $this['is_deadline_changed']);
        $this->widgetSchema->setFormFormatterName('TableMy');

        $this->widgetSchema['board_id']->setOption('query', Q::c('Board', 'b')
            ->where('b.Users.id = ?', $this->getUser()->getGuardUser()->getId()))
            ;


        /*
        $year = date('Y');
        $this->widgetSchema['deadline']->setOption('format', '%day%/%month%/%year%')
            ->setOption('years', [$year => $year, ($year + 1) => ($year + 1)])
        ; */

    }


    public function updateDefaultsFromObject()
    {
        parent::updateDefaultsFromObject(); // TODO: Change the autogenerated stub

        if($this->isNew()){
            $this->setDefault('deadline', date('d.m.Y'));

            $this->setDefault('executer_id', $this->getUser()->getGuardUser()->getId());
            $this->setDefault('responsible_id', $this->getUser()->getGuardUser()->getId());
        }
    }

    public function updateObject($values = null)
    {
        return parent::updateObject($values); // TODO: Change the autogenerated stub
    }

    public function doSave($con = null)
    {
        parent::doSave($con); // TODO: Change the autogenerated stub

        //notification
        MyNotificator::notify($this->getObject(), 'created');
    }
}