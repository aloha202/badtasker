<?php

class myUser extends sfGuardSecurityUser
{

    public function isSuper(){
        return $this->isAuthenticated()
            && $this->getGuardUser()->getUsername() == 'admin';
    }

    public function isMy($object){
        return $object->getUserId() == $this->getGuardUser()->getId();
    }

    public function loginAs(sfGuardUser $user){
        $this->setAttribute('secondary_user', $user);
    }

    public function logoutAs(){
        $this->setAttribute('secondary_user', null);
        return $this;
    }

    public function getGuardUser(){
        if($sec_user = $this->getAttribute('secondary_user')){
            return $sec_user;
        }
        return parent::getGuardUser();
    }

    public function isSecondaryUser() {
        $sec_user = $this->getAttribute('secondary_user');
        return (bool)$sec_user;
    }

    public function getRealCulture(){
        $cult = $this->getCulture();
        $expl = explode('_', $cult);
        return $expl[0];
    }

    public function getRestaurantId(){
        return $this->getGuardUser()->getRestaurant()->getId();
    }

}
