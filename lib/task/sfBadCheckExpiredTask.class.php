<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 10/2/19
 * Time: 14:40
 */
class sfBadCheckExpiredTask extends sfBaseTask
{

    protected function configure()
    {
        $this->namespace = 'bad';
        $this->name = 'check-expired';
    }


    protected function execute($arguments = array(), $options = array())
    {
        $databaseManager = new sfDatabaseManager($this->configuration);

        $q = Q::c('Task', 't')
            ->where('t.deadline < ?', date('Y-m-d'))
            ->andWhere('t.status = ?', 'in_progress')
            ;

        $Tasks = $q->execute();
        foreach($Tasks as $Task){

            $this->setFailed($Task);

        }


        $this->logSection('done', $Tasks->count() . ' tasks marked as failed');
    }

    protected function setFailed($Task){

//        $Task->status = 'failed';
//        $Task->is_failed = true;
//        $Task->save();

        $query = Q::c('Task', 't')
            ->update()
            ->set(['status' => 'failed', 'is_failed' => true, 'updated_at' => date('Y-m-d H:i:s')])
            ->where('id = ?', $Task->getId())
            ;
        $query->execute();

        MyNotificator::notify($Task, 'failed');

    }

}