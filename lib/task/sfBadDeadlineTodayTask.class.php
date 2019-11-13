<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 10/2/19
 * Time: 14:40
 */
class sfBadDeadlineTodayTask extends sfBaseTask
{

    protected function configure()
    {
        $this->namespace = 'bad';
        $this->name = 'deadline-today';
    }


    protected function execute($arguments = array(), $options = array())
    {
        $databaseManager = new sfDatabaseManager($this->configuration);

        $q = Q::c('Task', 't')
            ->where('t.deadline = ?', date('Y-m-d'))
            ->andWhere('t.is_deadline_notification_sent IS NULL')
            ;

        $Tasks = $q->execute();

        foreach($Tasks as $Task){

            MyNotificator::notify($Task, 'deadline_today');

            $query = Q::c('Task', 't')
                ->update()
                ->set(['is_deadline_notification_sent' => true])
                ->where('id = ?', $Task->getId())
            ;
            $query->execute();

        }


        $this->logSection('done', $Tasks->count() . ' deadline notifications sent');
    }


}