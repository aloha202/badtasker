<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author Alaxa
 */
class utilComponents extends sfComponents{
    
    public function executeNew_messages_count()
    {
        $this->module = isset($this->module) ? $this->module : sfInflector::underscore($this->model);
        $q = Q::c($this->model, 'a');
                            
        switch($this->model){
            case 'SiteEvent':
                $q = Doctrine::getTable('SiteEvent')->tmList($q);
                break;
            case 'QuizzTake':
                $q = Q::c('QuizzTake', 'a')
                        ->innerJoin('a.Quizz q')
                        ->where('q.user_id = ?', sfContext::getInstance()->getUser()->getGuardUser()->id)
                    ;
                break;
            default:          
        }
        $q->addWhere('a.is_backend_viewed = ?', false);
        $this->count = $q->count();

    }
    
}