<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormInputRange
 *
 * @author Alaxa
 */
class sfWidgetFormInputRange extends sfWidgetForm {

    protected function configure($options = array(), $attributes = array()) {
        //$this->addRequiredOption('type');
        $this->addOption('type', 'text');
        $this->addOption('label_from', 'From');
        $this->addOption('label_to', 'To');
        $this->addOption('template', '%label_from%%input_from%%label_to%%input_to%');
        $this->addOption('labels_as_placeholders', false);
        $this->addOption('input_from_class', 'range_from range_input');
        $this->addOption('input_to_class', 'range_to range_input');        
        // to maintain BC with symfony 1.2
       // $this->setOption('type', 'text');
    }

    /**
     * Renders the widget.
     *
     * @param  string $name        The element name
     * @param  string $value       The value displayed in this widget
     * @param  array  $attributes  An array of HTML attributes to be merged with the default HTML attributes
     * @param  array  $errors      An array of errors for the field
     *
     * @return string An HTML tag string
     *
     * @see sfWidgetForm
     */
    public function render($name, $value = null, $attributes = array(), $errors = array()) {
        $value_from = !empty($value['from']) ? $value['from'] : '';
        $value_to = !empty($value['to']) ? $value['to'] : '';
        $attrs_from = array('class' => $this->getOption('input_from_class'));
        $attrs_to = array('class' => $this->getOption('input_to_class'));
        if($this->getOption('labels_as_placeholders')){
            $attrs_from['placeholder'] = $this->getOption('label_from');
            $attrs_to['placeholder'] = $this->getOption('label_to');
        }
        
        $label_from = '<span class="label_from">' . T::__($this->getOption('label_from')) . '</span>';
        $input_from = $this->renderTag('input', array_merge(array('type' => $this->getOption('type'), 'name' => $name . '[from]', 'value' => $value_from), array_merge($attributes, $attrs_from)));
        $label_to = '<span class="label_to">' . T::__($this->getOption('label_to')) . '</span>';        
        $input_to = $this->renderTag('input', array_merge(array('type' => $this->getOption('type'), 'name' => $name . '[to]', 'value' => $value_to), array_merge($attributes, $attrs_to)));        
        
        return strtr($this->getOption('template'), array(
           '%label_from%' => $label_from,
            '%label_to%' => $label_to,
            '%input_from%' => $input_from,
            '%input_to%' => $input_to
        ));
        return $str;
    }

}
