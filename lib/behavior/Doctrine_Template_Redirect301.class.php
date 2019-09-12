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
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ImageBuilder
 *
 * @author Алекс
 */
class Doctrine_Template_Redirect301 extends Doctrine_Template {

    protected $_options = array(
        'field' => 'url',
        'application' => 'frontend',
        'route' => '',
        'builder' => array('ProjectHelper', 'generateApplicationUrl'),
        'inheritance_callback' => array('Doctrine_Template_Redirect301', 'processInheritance')
    );

    public function setTableDefinition() { 
        $this->addListener(new Doctrine_Template_Redirect301_Listener($this->_options, $this));
    }
   
    public static function processInheritance($object)
    {
        /*
        if($object->getTable()->hasTemplate('NestedSet')){
            if($object->getNode()->hasChildren()){
                foreach($object->getNode()->getChildren() as $child){
                    //$child->save();
                }
            }
        }
        */
    }
   

}