<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 6/15/18
 * Time: 22:56
 */
class sfGuardUserFormRestaurantAdmin extends sfGuardUserForm{

    protected $Restaurant;
    public function configure() {
        parent::configure();
        $this->Restaurant = $this->getOption('Restaurant');
        $this->useFields(array('email_address', 'username', 'password' ));
        $this->formatter('lanceng');
    }


    public function updateObject($values = null) {
        parent::updateObject();

        $this->getObject()->is_super_admin = true;
    }

    public function updateDefaultsFromObject() {
        parent::updateDefaultsFromObject();
    }

    public function doSave($con = null) {
        parent::doSave($con);
        $this->Restaurant->admin_id = $this->getObject()->id;
        $this->Restaurant->save();
    }

}