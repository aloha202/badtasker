<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ConfigFormSystem
 *
 * @author Alaxa
 */
class ConfigFormSystem extends BaseConfigForm {

    public function configure() {
        if (!$this->getObject()->getUseWysiwyg()) {
            $this->widgetSchema['value']->setAttribute('class', 'mceNoEditor');
        }
        
        unset($this['type_enum_values'], $this['type']);
    }

}