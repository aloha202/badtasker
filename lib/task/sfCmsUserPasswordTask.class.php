<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsClearData
 *
 * @author Алекс
 */
class sfCmsUserPasswordTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            #new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
        ));
        $this->namespace = 'cms';
        $this->name = 'user-password';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $dictionary = array(
          'editor' => 'editor1'  
        );
        
        $users = Q::c('sfGuardUser', 'u')
                ->execute()
                ;
        foreach($users as $user)
        {
            $password = !empty($dictionary[$user->getUsername()]) ? $dictionary[$user->getUsername()] : 'password';
            $user->setPassword($password);
            $user->save();
            $this->logSection('cms', $user . ' password changed');
        }
    }
}
