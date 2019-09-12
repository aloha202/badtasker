<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfileFormAvatar
 *
 * @author Алекс
 */
class ProfileFormGmaps extends BaseProfileForm
{
    public function configure()
    {
        $this->useFields(array('gmaps'));
        $this->widgetSchema['gmaps']->setOption('search_by_default', 'Беларусь, Минск');
        $this->widgetSchema->setFormFormatterName('blank'); 
    }

  public function updateObject($values = null){
      $object = parent::updateObject($values);
      if(!empty($this->values['gmaps'])){
        $object->setGeoLat($this->values['gmaps']['lat']);
        $object->setGeoLng($this->values['gmaps']['lng']);      
        $object->setGeoCity($this->values['gmaps']['city']);            
        $object->setGeoCountry($this->values['gmaps']['country']);                  
        $object->setGeoAddress($this->values['gmaps']['address']);                        
        $object->setGeoAddressFormatted($this->values['gmaps']['address_formatted']);                        
      }
      return $object;
  }
  
  public function updateDefaultsFromObject()
  {
      parent::updateDefaultsFromObject();
      if($this->getObject()->getGeoLat() && $this->getObject()->getGeoLng()){
          $this->setDefault('gmaps', array(
              'lat' => $this->getObject()->getGeoLat(), 
              'lng' => $this->getObject()->getGeoLng(),
              'city' => $this->getObject()->getGeoCity(),
              'country' => $this->getObject()->getGeoCountry(),              
              'address' => $this->getObject()->getGeoAddress(),                            
              'address_formatted' => $this->getObject()->getGeoAddressFormatted(),                                          
          ));
      }
  }  
}
