<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myWidgetFormNestedSet
 *
 * @author Алекс
 */
class myWidgetFormNestedSet extends sfWidgetForm {

    public function configure($options = array(), $attributes = array()) {
        $this->addRequiredOption('model');
        $this->addOption('root_id', 0);
    }

    public function render($name, $value = null, $attributes = array(), $errors = array()) {
        $rootId = $this->getOption('root_id');
        if ($rootId) {
            $root = Doctrine::getTable($model)->getTree()->findRoot($rootId);

            $tree = Doctrine::getTable($model)->getTree()->fetchBranch($root->getId());
        } else {
            $tree = Doctrine::getTable($model)->getTree()->fetchTree();
        }
        echo $tree;
        die;
    }

}
