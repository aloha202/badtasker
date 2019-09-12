<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormInputRangeDatepicker
 *
 * @author Alaxa
 */
class sfWidgetFormInputRangeDatepicker extends sfWidgetFormInputRange{

    protected function configure($options = array(), $attributes = array()) {
        $this->addOption('params', array());
        $this->setAttribute('datepicker', http_build_query($options['params']));
        parent::configure($options, $attributes);

        $this->setOption('input_from_class', $this->getOption('input_from_class') . ' datepicker');
        $this->setOption('input_to_class', $this->getOption('input_to_class') . ' datepicker');
    }

}

