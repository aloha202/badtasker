<?php

/**
 * dashboard actions.
 *
 * @package    cms
 * @subpackage dashboard
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class dashboardActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        
    }

    public function executeTest(sfWebRequest $request) {
        $categories = Doctrine::getTable('Category')
                ->createQuery('c')
                ->execute();
        foreach ($categories as $cat) {
            $cat->save();
        }
        echo $categories;

        die;
    }
    
    public function executeDeveloperOff()
    {
        setcookie('__developer__', false, false, '/');
        return $this->redirect('@homepage');
    }

}
