<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfPopulateBase
 *
 * @author aradyuk
 */
class sfPopulateBase {
    
    protected $counter = 0;
    
    public function __configure() {
        
    }
    
    
    protected function save($data) {
        
        try{
            $Object = new $this->model;
        
            $Object->fromArray($data);
        
            $Object->save();
            return $Object;
        }  catch (Exception $e){
            return false;
        }
        
    }
    
}
