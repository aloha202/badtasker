<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CmsFilter
 *
 * @author Алекс
 */
class CmsFilter extends sfFilter {

    public function execute($chain) {
        $user = sfContext::getInstance()->getUser();
        
        $chain->execute($chain);
    }

}
