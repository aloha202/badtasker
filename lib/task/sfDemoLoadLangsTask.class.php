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
class sfDemoLoadLangsTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            #new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
        ));
        $this->namespace = 'demo';
        $this->name = 'load-langs';
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        $db = $databaseManager->getDatabase('doctrine');
        $c = $db->getDoctrineConnection();
        $name = $c->getDatabaseName();
        $pass = $c->getOption('password');
        $password = $pass ? " -p$pass" : '';
        
        $c = mysql_connect('localhost', 'root', $pass);
        $yml = sfYaml::load(sfConfig::get('sf_config_dir') . '/app.yml');
        $langs = $yml['all']['langs']['all'];
        foreach($langs as $key=>$lang){
            $db_file = "data/langs/$key.sql";
            if(!file_exists($db_file)){
                $this->logSection("$key", "File $db_file not found");
                continue;
            }
            $dbname = "{$name}_{$key}";
            mysql_query("DROP DATABASE IF EXISTS $dbname");
            mysql_query("CREATE DATABASE $dbname");
            shell_exec("mysql -uroot{$password} $dbname < $db_file");
            //$this->logSection("$key", mysql_error());
            $this->logSection("$key", "$db_file loaded into $dbname");
        }

        
    }    
}
