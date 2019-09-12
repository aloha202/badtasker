<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Doctrine_Template_Meta_Listener
 *
 * @author Алекс
 */
class Doctrine_Template_Geo_Listener extends Doctrine_Record_Listener {

    protected $_options = array();

    public function __construct(array $options) {
        $this->_options = $options;
    }

}
