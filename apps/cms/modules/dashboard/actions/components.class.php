<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author Алекс
 */
class dashboardComponents extends sfComponents{
    
    public function executeVisit_today()
    {
        $this->visit_count = Q::c('SiteVisit', 'v')
                ->where('DATE(v.created_at) = ?', date('Y-m-d'))
                ->count()
                ;
        
    }
    
    public function executeVisit_total()
    {
        $this->visit_count = Q::c('SiteVisit', 'v')
               // ->where('DATE(v.created_at) = ?', date('Y-m-d'))
                ->count()
                ;
    }   
    
    public function executeEvent_today()
    {
        $this->count = Q::c('SiteEvent', 'v')
                ->where('DATE(v.created_at) = ?', date('Y-m-d'))
                ->count()
                ;
        
    }
    
    public function executeEvent_total()
    {
        $this->count = Q::c('SiteEvent', 'v')
               // ->where('DATE(v.created_at) = ?', date('Y-m-d'))
                ->count()
                ;
    }    
    
}
