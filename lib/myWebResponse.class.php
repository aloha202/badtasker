<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myWebResponse
 *
 * @author Алекс
 */
class myWebResponse extends sfWebResponse{
    
    public function addTitle($value)
    {
        $this->setTitle($value);
    }
    
    public function setMeta($object, $replacements_object = null)
    {
        $this->addTitle($object->getReplaced('meta_title', $replacements_object));
        $this->addMeta('keywords', $object->getMetaKeywords());           
        $this->addMeta('description', $object->getMetaDescription());         
    }
    
    public function getStylesheets($position = 'ALL')
    {
        
        $app = sfContext::getInstance()->getConfiguration()->getApplication();
        if(file_exists(sfConfig::get('sf_web_dir') . '/cache/' . $app . '.css')){
            return array('/cache/' . $app . '.css' => array());
        }
        return parent::getStylesheets($position);
    }
    
    public function getJavascripts($position = 'ALL')
    {
        $app = sfContext::getInstance()->getConfiguration()->getApplication();
        if(file_exists(sfConfig::get('sf_web_dir') . '/cache/' . $app . '.js')){
            return array('/cache/' . $app . '.js' => array());
        }
        $js = parent::getJavascripts($position);        
        $lang = sfContext::getInstance()->getCurrentLang();
        $js['langs/jquery.ui.datepicker-' . $lang . '.js'] = array();
        return $js;
    }    
    
}
