<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myContext
 *
 * @author Алекс
 */
class myContext extends sfContext {

    protected $cart = null;

    public function getCart() {
        if (!$this->cart) {
            $this->cart = new Cart();
        }
        return $this->cart;
    }

    public function matchId($prop_name, $id) {
        $object = $this->has($prop_name) ? $this->get($prop_name) : null;
        if (!$object) {
            return false;
        }
        return $object->get('id') == $id;
    }

    public function isActiveCategory($category) {
        if ($this->matchId('catalog.category', $category->getId())) {
            return true;
        }
        if ($category->getNode()->hasChildren()) {
            foreach ($category->getNode()->getChildren() as $child) {
                if ($this->matchId('catalog.category', $child->getId())) {
                    return true;
                }
            }
        }
        return false;
    }

    public function isDeveloper() {

        return !empty($_COOKIE['__developer__']) && $_COOKIE['__developer__'] == 'a2c787d52628c98579c7aa5849d18cdf110808c7';
    }

    public function isDemo() {
        return $_SERVER['SERVER_NAME'] == 'demo.web375.org' 
        && !P::is_local()
                ;
    }
    
    public function isEditor()
    {
        return $this->isDeveloper()
                || ($this->getUser()->isAuthenticated() && $this->getUser()->getGuardUser()->getUsername() == 'editor');
    }
    
    public function getCurrentLang()
    {
        return isset($_SESSION['lang']) ? $_SESSION['lang'] : 'en';
    }

    public function checkModuleAction($mod, $action) {
        $res = $this->getActionName() == $action && $this->getModuleName() == $mod;
        return $res;
    }

    public function checkModuleActions($mod_actions) {
        foreach ($mod_actions as $mod_act) {
            if ($this->checkModuleAction($mod_act[0], $mod_act[1])) {
                return true;
            }
        }
        return false;
    }
    
    public function matchesUrl($url) {
        if(strpos($url, '/') !== false){
            list($mod, $action) = explode('/', $url);
            if($action != 'index'){
                return $this->checkModuleAction($mod, $action);
            }else{
                return $this->getModuleName() == $mod;
            }
        }else{
            return $this->getModuleName() == $url;
        }
    }


}
