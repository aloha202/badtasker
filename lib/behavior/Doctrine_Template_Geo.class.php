<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Doctrine_Template_Meta
 *
 * @author Алекс
 */
class Doctrine_Template_Geo extends Doctrine_Template{
   
    protected $_options = array(
        'engine' => 'google'
    );
    
    public function setTableDefinition()
    {
        $this->hasColumn('geo_lat', 'string', 32, array(
             'type' => 'string',
             'length' => 32,
             ));
        $this->hasColumn('geo_lng', 'string', 32, array(
             'type' => 'string',
             'length' => 32,
             ));
        $this->hasColumn('geo_country', 'string', 32, array(
             'type' => 'string',
             'length' => 32,
             ));        
        $this->hasColumn('geo_city', 'string', 32, array(
             'type' => 'string',
             'length' => 32,
             ));                
        $this->hasColumn('geo_address', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));     
        $this->hasColumn('geo_address_formatted', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));         
        
      //  $this->addListener(new Doctrine_Template_Geo_Listener($this->_options));        
    }    
    
    public function getGeoCoords()
    {
        $object = $this->getInvoker();
        return array(
            'lat' => $object->getGeoLat(),
            'lng' => $object->getGeoLng()
        );
    }    
    
    public function setGeoCoords($array)
    {
        $object = $this->getInvoker();
        $object->setGeoLat($array['lat']);
        $object->setGeoLng($array['lng']);
    }
    
    public function setGeoVals($geo_object)
    {
        $object = $this->getInvoker();
        $fields = array('geo_lat', 'geo_lng', 'geo_city', 'geo_country', 'geo_address', 'geo_address_formatted');
        foreach($fields as $name){
            $object->set($name, $geo_object->get($name));
        }
    }
    
    public function getLatLng()
    {
        $object = $this->getInvoker();
        return join(',', $object->getGeoCoords());
    }
    public function hasGeo()
    {
        $object = $this->getInvoker();
        return $object->getGeoLat() && $object->getGeoLng();
    }
    
}
