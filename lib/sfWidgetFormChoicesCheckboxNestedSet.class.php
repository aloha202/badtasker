<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormChoicesCheckboxNestedSet
 *
 * @author Алекс
 */
class sfWidgetFormSelectCheckboxNestedSet extends sfWidgetFormSelectCheckbox {

    protected function configure($options = array(), $attributes = array()) {
        parent::configure($options, $attributes);

        $this->addOption('class', 'checkbox_list checkbox_list_nested_set');
        $this->addOption('label_separator', '&nbsp;');
        $this->addOption('separator', "\n");
        $this->addOption('formatter', array($this, 'formatter'));
        $this->addOption('template', '%group% %options%');
    }

    /**
     * Renders the widget.
     *
     * @param  string $name        The element name
     * @param  string $value       The value selected in this widget
     * @param  array  $attributes  An array of HTML attributes to be merged with the default HTML attributes
     * @param  array  $errors      An array of errors for the field
     *
     * @return string An HTML tag string
     *
     * @see sfWidgetForm
     */
    public function render($name, $value = null, $attributes = array(), $errors = array()) {
        if ('[]' != substr($name, -2)) {
            $name .= '[]';
        }

        if (null === $value) {
            $value = array();
        }

        $choices = $this->getChoices();

        // with groups?
        if (count($choices) && is_array(current($choices))) {
            $parts = array();
            foreach ($choices as $key => $option) {
                $parts[] = strtr($this->getOption('template'), array('%group%' => $key, '%options%' => $this->formatChoices($name, $value, $option, $attributes)));
            }

            return implode("\n", $parts);
        } else {
            return $this->formatChoices($name, $value, $choices, $attributes);
        }
    }

    protected function formatChoices($name, $value, $choices, $attributes) {
        $inputs = array();
        foreach ($choices as $key => $option) {
            $baseAttributes = array(
                'name' => $name,
                'type' => 'checkbox',
                'value' => self::escapeOnce($key),
                'id' => $id = $this->generateId($name, self::escapeOnce($key)),
            );

            if ((is_array($value) && in_array(strval($key), $value)) || strval($key) == strval($value)) {
                $baseAttributes['checked'] = 'checked';
            }
            if ($option->getLevel() == 0) {
                $baseAttributes['disabled'] = 'disabled';
            }

            $inputs[$id] = array(
                'input' => $this->renderTag('input', array_merge($baseAttributes, $attributes)),
                'label' => $this->renderContentTag('label', self::escapeOnce($option), array('for' => $id)),
                'level' => $option->getLevel()
            );
        }

        return call_user_func($this->getOption('formatter'), $this, $inputs);
    }

    public function formatter($widget, $inputs) {
        $rows = array();
        foreach ($inputs as $input) {
            $rows[] = $this->renderContentTag('li', $input['input'] . $this->getOption('label_separator') . $input['label'], array(
                'class' => 'level_' . $input['level']
                    ));
        }

        return!$rows ? '' : $this->renderContentTag('ul', implode($this->getOption('separator'), $rows), array('class' => $this->getOption('class')));
    }

}
