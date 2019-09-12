<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormSchemaFormatter_Base
 *
 * @author Alaxa
 */
class sfWidgetFormSchemaFormatter_Base extends sfWidgetFormSchemaFormatter{
    public function generateLabel($name, $attributes = array()) {
        $labelName = $this->generateLabelName($name);

        if (false === $labelName) {
            return '';
        }

        if (!isset($attributes['for'])) {
            $attributes['for'] = $this->widgetSchema->generateId($this->widgetSchema->generateName($name));
        }
        if (!isset($attributes['class'])) {
            $attributes['class'] = 'control-label';
        }
        $req = '';
        if ($this->widgetSchema[$name]->getAttribute('required') || $this->widgetSchema[$name]->getAttribute('required_field')) {
            $req .= '<strong>*</strong>';
        }

        return $this->widgetSchema->renderContentTag('label', $labelName . $req, $attributes);
    }

    public function translate($subject, $parameters = array()) {
        return T::__($subject, $parameters);
    }
}