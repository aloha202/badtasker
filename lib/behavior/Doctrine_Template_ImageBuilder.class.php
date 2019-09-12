<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ImageBuilder
 *
 * @author Алекс
 */
class Doctrine_Template_ImageBuilder extends Doctrine_Template {

    protected $_options = array(
        'preset_name' => null
    );

    public function setTableDefinition() {
        $this->addListener(new ImageBuilderListener($this->_options));
    }
    
    public function getPhotoPath()
    {
        $object = $this->getInvoker();
        return 'http://' . $_SERVER['SERVER_NAME'] . '/uploads/' . sfInflector::underscore(get_class($object)) . '/' . $object->getImage();
    }
    
    public function getImageFullPath()
    {
        $object = $this->getInvoker();
        return sfConfig::get('sf_web_dir') . '/uploads/' . sfInflector::underscore(get_class($object)) . '/' . $object->getImage();        
    }
    
    public function getImageThumbnail($name = 'small')
    {
        $object = $this->getInvoker();
        if($object->getImage()){
            $aThumbs = sfConfig::get('app_' . sfInflector::underscore(get_class($object)) . '_thumbs');
            if(isset($aThumbs[$name])){
                return $object->getPhotoPath() . $aThumbs[$name]['ext'];
            }
            return $object->getPhotoPath();
        }
        return DefaultImage::getOne()->getImageThumbnail($name . '_' . sfInflector::underscore(get_class($object)));
    } 
    
    public function deleteImage()
    {
        $object = $this->getInvoker();
        $aThumbs = sfConfig::get('app_' . sfInflector::underscore(get_class($object)) . '_thumbs');
        foreach($aThumbs as $name => $props){
            @unlink($object->getImageFullPath() . $props['ext']);
        }
        @unlink($object->getImageFullPath());
        $object->setImage(null);
        $object->save();
    }

}
