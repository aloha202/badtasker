<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfileFormAvatar
 *
 * @author Алекс
 */
class ProfileFormAvatar extends BaseProfileForm
{
    public function configure()
    {
        $this->useFields(array('image'));
        $this->widgetSchema->setFormFormatterName('blank');
    }
}
