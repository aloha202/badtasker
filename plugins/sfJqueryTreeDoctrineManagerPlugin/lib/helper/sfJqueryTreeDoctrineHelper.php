<?php
    
    function get_nested_set_manager($model, $field, $root = 0){
        
        if ( !sfConfig::has('app_sfJqueryTree_withContextMenu') ){
            sfConfig::set('app_sfJqueryTree_withContextMenu',true);
        }
    
        sfContext::getInstance()->getResponse()->addStylesheet('/sfJqueryTreeDoctrineManagerPlugin/jsTree/themes/default/style.css');
        sfContext::getInstance()->getResponse()->addStylesheet('/sfJqueryTreeDoctrineManagerPlugin/css/screen.css');
  //      sfContext::getInstance()->getResponse()->addJavascript('/sfJqueryTreeDoctrineManagerPlugin/jsTree/jquery.js');
        sfContext::getInstance()->getResponse()->addJavascript('/sfJqueryTreeDoctrineManagerPlugin/jsTree/jquery.cookie.js', 'last');
        sfContext::getInstance()->getResponse()->addJavascript('/sfJqueryTreeDoctrineManagerPlugin/jsTree/jquery.tree.js', 'last');
        sfContext::getInstance()->getResponse()->addJavascript('/sfJqueryTreeDoctrineManagerPlugin/jsTree/plugins/jquery.tree.cookie.js', 'last');
        
        if ( sfConfig::get('app_sfJqueryTree_withContextMenu') ){
            sfContext::getInstance()->getResponse()->addJavascript('/sfJqueryTreeDoctrineManagerPlugin/jsTree/plugins/jquery.tree.contextmenu.js', 'last');
        }
        
        return get_component('sfJqueryTreeDoctrineManager', 'manager', array('model' => $model, 'field' => $field, 'root' => $root));
    }