<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfPopulatesfGuardUser
 *
 * @author aradyuk
 */
class sfPopulatesfGuardUser extends sfPopulateBase{
    
    protected $model = 'sfGuardUser';
    
    
    public function execute($count = 100, $silent = false) {
        srand();
        while($this->counter < $count){
            $sexes = array('m', 'f');
            $sex = rand(0, 1);

            $data_dir = sfConfig::get('sf_data_dir') . '/populate';
            $filename = $sex == 'm' ? 'boys_names.txt' : 'girls_names.txt';
            $first_names = file( $data_dir . '/' . $filename);
            $last_names = file($data_dir . '/last_names.txt');


            $first_name = trim($first_names[rand(0, count($first_names) - 1)]);
            $last_name = trim($last_names[rand(0, count($last_names) - 1)]);        

            $email = strtolower("{$first_name}.{$last_name}@gmail.com");

            $User = $this->save(array(
               'first_name' => $first_name,
                'last_name' => $last_name,
                'username' => $email,
                'email_address' => $email,
                'password' => 'password',
                'salt' => sha1($email . microtime()),
                'algorithm' => 'sha1',
                'is_active' => true,
                'is_super_admin' => false
            ));
            if($User){
                $this->counter ++;
                if(!$silent){
                    echo $User . "\n";
                }
            }
        }
        
        
    }
    
}
