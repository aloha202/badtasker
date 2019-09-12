<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfDbDumpTask
 *
 * @author Алекс
 */
class sfDbDumpTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            #new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
        ));
        $this->addOptions(array(
          new sfCommandOption('path', null, sfCommandOption::PARAMETER_REQUIRED, 'Specify path', 'data/dump.sql'),        
          new sfCommandOption('with-create', null, sfCommandOption::PARAMETER_REQUIRED, 'Specify path', false),                    
          new sfCommandOption('tables', null, sfCommandOption::PARAMETER_REQUIRED, 'Specific tables', false),                                
        ));         
        $this->namespace = 'db';
        $this->name = 'dump';
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $path = $options['path'];
        $create = $options['with-create'] ? '' : '--no-create-info';
        $db = $databaseManager->getDatabase('doctrine');
        $c = $db->getDoctrineConnection();
        $name = $c->getDatabaseName();
        $pass = $c->getOption('password');
        $pass = $pass ? " -p$pass" : '';    
        $tables = $options['tables'];
        if($tables){
            $tables = join(' ', explode(',', $tables));
        }
        
        shell_exec("mysqldump -uroot{$pass} $name $tables > $path $create --complete-insert");
        $this->logSection('db', "dumped to $path");
    }    
}
