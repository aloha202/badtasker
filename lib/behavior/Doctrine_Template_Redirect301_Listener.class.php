<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ImageBuilderListener
 *
 * @author Алекс
 */
class Doctrine_Template_Redirect301_Listener extends Doctrine_Record_Listener {

    protected $_options = array();
    protected $_image = '';

    public function __construct(array $options, Doctrine_Template $template) {
        $this->_options = $options;
    }

    public function preUpdate(Doctrine_Event $event) {
        if(php_sapi_name() == 'cli'){//cli
            return;
        }
        $object = $event->getInvoker();
        $modified = $object->getModified();        
        $modified_old = $object->getModified(true);        
        

        if(isset($modified[$this->_options['field']])){
            $object_old = clone $object;
            $modified_old = $object->getModified(true);
            $object_old->fromArray($modified_old);            
            $old_url =  $this->generateUrl($object_old);
            $new_url = $this->generateUrl($object);
            if(!$object->isNew()){
                $redirect301 = Doctrine::getTable('Redirect301')->findOneByUrlFrom($old_url) ?: new Redirect301;
                $redirect301->fromArray(array(
                    'url_from' => $old_url,
                    'url_to' => $new_url,
                    'comment' => T::____(get_class($object)) . ': ' . $object
                ));
                $redirect301->save();                
            }
        }

    
    }

    protected function generateUrl($object) {
        return call_user_func_array($this->_options['builder'], array($this->_options['application'], $this->_options['route'], $object));
    }
   
    protected function processInheritance($object)
    {
        return call_user_func_array($this->_options['inheritance_callback'], array($object));
    }

}
