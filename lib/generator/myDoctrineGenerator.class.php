<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myDoctrineGenerator
 *
 * @author Алекс
 */
class myDoctrineGenerator extends sfDoctrineGenerator {

    public function getActionsBaseClass() {
        return isset($this->params['actions_base_class']) ? $this->params['actions_base_class'] : 'myActions';
    }

    public function getExtra() {
        return isset($this->params['extra']) ? $this->params['extra'] : array();
    }

    public function getExtraJavascript() {
        $extra = $this->getExtra();
        return isset($extra['javascript']) ? $extra['javascript'] : array();
    }

    public function getShowhideFormFields() {
        $javascript = $this->getExtraJavascript();
        return isset($javascript['showhide_form_fields']) ? $javascript['showhide_form_fields'] : false;
    }
    
    public function getShowhideSelects() {
        $javascript = $this->getExtraJavascript();
        return isset($javascript['showhide_selects']) ? $javascript['showhide_selects'] : false;
    }     
    
    public function getExportFilename()
    {
        $extra = $this->getExtra();
        if(!empty($extra['export'])){
            if(!empty($extra['export']['filename'])){
                return $extra['export']['filename'];
            }
        }
        return "%date% - " . $this->getPluralName();
    }
    
    public function getExportMode()
    {
        $extra = $this->getExtra();
        if(!empty($extra['export'])){
            if(!empty($extra['export']['mode'])){
                return $extra['export']['mode'];
            }
        }
        return 'csv';        
    }
    
    public function getExportDateformat()
    {
        $extra = $this->getExtra();
        if(!empty($extra['export'])){
            if(!empty($extra['export']['dateformat'])){
                return $extra['export']['dateformat'];
            }
        }
        return 'Y.m.d';        
    } 
    
    public function getExportEncoding()
    {
        $extra = $this->getExtra();
        if(!empty($extra['export'])){
            if(!empty($extra['export']['encoding'])){
                return $extra['export']['encoding'];
            }
        }
        return 'utf-8';        
    }   
    
    public function getExportDisplay()
    {
        $extra = $this->getExtra();
        if(!empty($extra['export'])){
            if(!empty($extra['export']['display'])){
                return $extra['export']['display'];
            }
        }
        return false;        
    }    
    
    public function getExtraFormFromFilters()
    {
        $extra = $this->getExtra();
        if($extra){
            if(!empty($extra['form'])){
                if(!empty($extra['form']['from_filters'])){
                    return $extra['form']['from_filters'];
                }
            }
        }
        return false;
    }
    
    public function getAjaxFormValidation() {
        $javascript = $this->getExtraJavascript();
        $validation = isset($javascript['ajax_form_validation']) ? $javascript['ajax_form_validation'] : false;
        return $validation;
    }      

    public function renderField($field) {
        $html = $this->getColumnGetter($field->getName(), true);

        if ($renderer = $field->getRenderer()) {
            $html = sprintf("$html ? call_user_func_array(%s, array_merge(array(%s), %s)) : '&nbsp;'", $this->asPhp($renderer), $html, $this->asPhp($field->getRendererArguments()));
        } else if ($field->isComponent()) {

            return sprintf("get_component('%s', '%s', array('type' => 'list', '%s' => \$%s))", $this->getModuleName(), $field->getName(), $this->getSingularName(), $this->getSingularName());
        } else if (get_class($field) == 'myModelGeneratorConfigurationField' && $field->isComponentListFormField()) {
            return sprintf("get_component('%s', 'ff', array('type' => 'list', 'field' => '%s', '%s' => \$%s))", $this->getModuleName(), $field->getName(), $this->getSingularName(), $this->getSingularName());
        } else if ($field->isPartial()) {
            return sprintf("get_partial('%s/%s', array('type' => 'list', '%s' => \$%s))", $this->getModuleName(), $field->getName(), $this->getSingularName(), $this->getSingularName());
        } else if ('Date' == $field->getType()) {
            $html = sprintf("false !== strtotime($html) ? format_date(%s, \"%s\") : '&nbsp;'", $html, $field->getConfig('date_format', 'f'));
        } else if ('Boolean' == $field->getType()) {
            $html = sprintf("get_partial('%s/list_field_boolean', array('value' => %s))", $this->getModuleName(), $html);
        }

        if ($field->isLink()) {
            $html = sprintf("link_to(%s, '%s', \$%s)", $html, $this->getUrlForAction('edit'), $this->getSingularName());
        }

        return $html;
    }
    
    public function __call($name, $arguments)
    {
        if(strpos($name, 'getExtra') === 0){
            $params = explode('_', sfInflector::underscore(str_replace('getExtra', '', $name)));
            $extra = $this->getExtra();
            $arr = $extra;
            foreach($params as $name){
                if(!is_array($arr)){
                    throw new Exception('Not array value found before the end of array in myDoctrineGenerator::' . $name);
                }
                if(isset($arr[$name])){
                    $arr = $arr[$name];
                }else{
                    return false;
                }
            }
            return $arr;
        }
    }    
    
    
    public function getTable()
    {
        return $this->table;
    }

    public function getLinkToAction($actionName, $params, $pk_link = false)
    {
        $action = isset($params['action']) ? $params['action'] : 'List'.sfInflector::camelize($actionName);

        $url_params = $pk_link ? '?'.$this->getPrimaryKeyUrlParams() : '\'';
        $icon = !empty($params['icon']) ? "<i class=\"fa fa-{$params['icon']}\"></i>" : '';
        $params['label'] = $icon . $params['label'];

        return '[?php echo link_to(__(\''.$params['label'].'\', array(), \''.$this->getI18nCatalogue().'\'), \''.$this->getModuleName().'/'.$action.$url_params.', '.$this->asPhp($params['params']).') ?]';
    }

}
