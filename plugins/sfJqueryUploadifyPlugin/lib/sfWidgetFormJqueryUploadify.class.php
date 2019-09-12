<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormJqueryUploadify
 *
 * @author Алекс
 */
class sfWidgetFormJqueryUploadify extends sfWidgetFormInputHidden{
    
    public static $entity_count = 0;
    
    public function configure($options = array(), $attributes = array())
    {
        
        $this->addRequiredOption('model');
        $this->addRequiredOption('remove_action');  
        $this->addOption('get_objects_action', 'sfUploadify/getObjects');  
        $this->addOption('edit_action', false);          
        $this->addOption('template', '<div class="sf_uploadify_wrapper">%input%%script%</div><div id="%images_holder_id%"></div>');
        $this->addOption('template_image', '<div class="sf_uploadify_image"><a href="#" class="edit" target="_blank">%image%</a><a href="%remove_url%" class="remove"><img src="/sfJqueryUploadifyPlugin/images/delete.png" /></a></div>');
        $this->addOption('file_input_id', false);
        $this->addOption('hidden_input_id', false);
        $this->addOption('jsparams', array());
        $this->addOption('delimiter', ' ');
        $this->addOption('images_holder_id', false);
        $this->addOption('sizeLimit', 1048576);
        parent::configure($options, $attributes);
    }
    
    public function render($name, $value = null, $attributes = array(), $errors = array())
    {
        if(!self::$entity_count){
            $response = sfContext::getInstance()->getResponse();
            $response->addJavascript('/sfJqueryUploadifyPlugin/js/swfobject.js');
            $response->addJavascript('/sfJqueryUploadifyPlugin/js/jquery.uploadify.v2.1.4.min.js');
            $response->addJavascript('/sfJqueryUploadifyPlugin/js/sfJqueryUploadify.js');
            
            $response->addStylesheet('/sfJqueryUploadifyPlugin/css/uploadify.css');
        }
        self::$entity_count++;
        $template = $this->getOption('template');
        
        
        $file_input_id = $this->getFileInputId();
        $file_input = "<input type='file' id='$file_input_id' />";
        $hidden_attributes = array_merge($attributes, array(
           'id' => $this->getHiddenInputId() 
        ));
        $hidden_input = parent::render($name, $value, $hidden_attributes, $errors);
        $script = $this->getScript();
        
        return strtr($template, array(
           '%input%' => $file_input . $hidden_input,
            '%script%' => $script,
            '%images_holder_id%' => $this->getImagesHolderId()
        ));
    }
    
    protected function getFileInputId()
    {
        if($id = $this->getOption('file_input_id')){
            return $id;
        }
        return 'sf_uploadify_file_input_' . self::$entity_count;
    }

    protected function getHiddenInputId()
    {
        if($id = $this->getOption('hidden_input_id')){
            return $id;
        }
        return 'sf_uploadify_hidden_input_' . self::$entity_count;
    }   
    
    protected function getImagesHolderId()
    {
        if($id = $this->getOption('images_holder_id')){
            return $id;
        }
        return 'sf_uploadify_images_holder_' . self::$entity_count;
    }    
    
    protected function getScript()
    {
        $context = sfContext::getInstance();
        $view = new sfPartialView($context, 'sfUploadify', '_script', '');
        $vars = array(
          'file_input_id' => $this->getFileInputId(),
            'hidden_input_id' => $this->getHiddenInputId(),
            'params' => json_encode($this->getOption('jsparams')),
            'template_image' => str_replace("\n", '', $this->getOption('template_image')),
            'delimiter' => $this->getOption('delimiter'),
            'images_holder_id' => $this->getImagesHolderId(),
            'remove_action' => $this->getOption('remove_action'),
            'get_objects_action' => $this->getOption('get_objects_action'),            
            'sizeLimit' => $this->getOption('sizeLimit'),
            'model' => $this->getOption('model'),
            'edit_action' => $this->getOption('edit_action')
        );
        $view->setPartialVars($vars);
        return $view->render();
    }
    
    public function isHidden()
    {
        return false;
    }
    
}
