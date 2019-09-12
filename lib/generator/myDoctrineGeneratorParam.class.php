<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myDoctrineGeneratorSlug
 *
 * @author Алекс
 */
class myDoctrineGeneratorParam extends myDoctrineGenerator{
    public function renderField($field) {
        if ($field->isLink()) {
            $html = $this->getColumnGetter($field->getName(), true);
            return sprintf("link_to(%s, url_for('%s', array('sf_subject' => \$%s, 'param' => %s)))", $html, $this->getUrlForAction('edit'), $this->getSingularName(), $this->getParam());
        }
        return parent::renderField($field);
    }
    
    protected function getParam()
    {
        return "\$sf_request->getParameter('param')";
    }
}
