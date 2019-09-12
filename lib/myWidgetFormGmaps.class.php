<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myFromWidgetGmaps
 *
 * @author Алекс
 */
class myWidgetFormGmaps extends sfWidgetForm{
    
    public static $entity_count = 0;
    public function configure($options = array(), $attributes = array())
    {
        $this->addOption('template', '
            <div class="my_widget_form_gmaps" map_id="%map_id%">
    <div style="padding-bottom: 20px; max-width: 500px;" class="input-group">
    %input_address%
    <span class="input-group-btn">%input_address_button%</span>
    </div>            

                        
            <div id="%map_id%" style="%map_style%"></div>
            %input_lat%
            %input_lng%
            %script%
            %other_inputs%
        </div>');
        $this->addOption('map_style', 'width: 500px;height: 350px;');
        $this->addOption('center', MyConfig::get('map_center')); 
        $this->addOption('zoom', MyConfig::get('map_zoom'));
        $this->addOption('icon', false);        
        $this->addOption('search_by_default', null);            
    }
    
    
    public function render($name, $value = null, $attributes = array(), $errors = array())
    {
        self::$entity_count++;
        $input_id = $this->getInputId();
        $input_lat = "<input type='hidden' class='input_lat' name='{$name}[lat]' value='{$value['lat']}' id='{$input_id}lat' />";
        $input_lng = "<input type='hidden' class='input_lng' name='{$name}[lng]' value='{$value['lng']}' id='{$input_id}lng' />";
        $address_ph = T::__('Введите адрес');
        $button_value = T::__('Найти на карте');        
        $input_address = "<input type='text' class='input_lookup_address span12 form-control' id='{$input_id}address' placeholder='$address_ph' />";        
        $input_address_button = "<button class='btn btn-default input_lookup_address_button' type='button' id='{$input_id}address_button' >$button_value</button>";                
        $other_inputs = "
            <input type='hidden' class='input_country' name='{$name}[country]' value='{$value['country']}' id='{$input_id}country' />
            <input type='hidden' class='input_city' name='{$name}[city]' value='{$value['city']}' id='{$input_id}city' />                
            <input type='hidden' class='input_address' name='{$name}[address]' value='{$value['address']}' id='{$input_id}address' />                                
            <input type='hidden' class='input_address_formatted' name='{$name}[address_formatted]' value='{$value['address_formatted']}' id='{$input_id}address_formatted' />                                                
            ";
        if($by_def = $this->getOption('search_by_default')){
            $other_inputs .= "<input type='hidden' value='$by_def' class='search_by_default' />";
        }
        
        $script = $this->getScript();
        return strtr($this->getOption('template'), array(
           '%input_lat%' => $input_lat,
            '%input_lng%' => $input_lng,
            '%map_id%' => $this->getMapId(),
            '%script%' => $script,
            '%map_style%' => $this->getOption('map_style'),
            '%input_address%' => $input_address,
            '%input_address_button%' => $input_address_button,            
            '%other_inputs%' => $other_inputs
        ));
    }
    
    protected function getMapId()
    {
        return 'my_widget_form_gmaps_' . $this->getEntityId();
    }
    
    protected function getInputId()
    {
        return 'my_widget_form_gmaps_input_' . $this->getEntityId() . '_';
    }
    
    protected function getEntityId()
    {
        return self::$entity_count;
    }
    
    protected function getScript()
    {
        $defaultCenter = $this->getOption('center');
        $zoom = $this->getOption('zoom');
        $input_id = $this->getInputId();
        //$url_geocode_address = sfContext::getInstance()->getController()->genUrl('util/geocodeAddress');
        $lang = sfContext::getInstance()->getCurrentLang();
        $script = <<<SCRIPT
   <script type='text/javascript'>
   $(function(){
                
       if(!window.google_maps){
            window.google_maps = {};
       }
       
       
       var gmapsInterval = setInterval(function(){
            if(!$('#{$this->getMapId()}').isVisible()){
                $('#{$this->getMapId()}').html(system_loading_gif());
                return;
            }
            $('#{$this->getMapId()}').html('');
            clearInterval(gmapsInterval);
            var id = '{$this->getMapId()}';            
            var center = new google.maps.LatLng($defaultCenter);
            var lat = $('#{$input_id}lat').val();
            var lng = $('#{$input_id}lng').val();
            if(lat && lng){
                center = new google.maps.LatLng(lat, lng);
            }else{
                 //$('#{$input_id}lat').val(center.lat());
                 //$('#{$input_id}lng').val(center.lng());
            }
             var myOptions = {
                 zoom: $zoom,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             }
             map = new google.maps.Map(document.getElementById(id),
                 myOptions);

             map.setCenter(center);
             marker = new google.maps.Marker({
                 map:map,
                 draggable:true,
                 animation: google.maps.Animation.DROP,
                 position: center,
                 icon: '{$this->getOption('icon')}'
             });
             google.maps.event.addListener(marker, 'dragend', function(event){
                 var pos = event.latLng;
                 $('#{$input_id}lat').val(pos.lat());
                 $('#{$input_id}lng').val(pos.lng());
                 if(typeof map.onDragEnd != 'undefined')
                     map.onDragEnd(pos.lat(), pos.lng());
             });
             window.google_maps[id] = {map: map, marker: marker};           
       }, 1000);

        


    });
    
    </script>
        
SCRIPT;
            
        return $script;
    }
    
}
