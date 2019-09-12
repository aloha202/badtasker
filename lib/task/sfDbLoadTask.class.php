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
class sfDbLoadTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            #new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
        ));
        $this->addOptions(array(
          new sfCommandOption('path', null, sfCommandOption::PARAMETER_REQUIRED, 'Specify path', 'data/dump.sql'),        
        ));                 
        $this->namespace = 'db';
        $this->name = 'load';
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        $path = $options['path'];        
        $db = $databaseManager->getDatabase('doctrine');
        $c = $db->getDoctrineConnection();
        $name = $c->getDatabaseName();
        $pass = $c->getOption('password');
        $pass = $pass ? " -p$pass" : '';           
        
        shell_exec("mysql -uroot{$pass} $name < $path");
        
        $this->logSection('db', "loaded from $path");
        
    }    
}
