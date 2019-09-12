<?php

/**
 * Created by PhpStorm.
 * User: alexradyuk
 * Date: 6/22/18
 * Time: 19:11
 */
class RestaurantConfigFormRestaurant extends RestaurantConfigForm
{
    public function configure() {

        $this->useFields(array('keyname', 'value'));
        $textareas = array( 'restaurant_css');

        if($this->getObject()->datatype == 'enum'){
            $this->widgetSchema['value'] = new sfWidgetFormChoice(array(
                'choices' => $this->getObject()->getOptions()
            ));
        }else{
            if(in_array($this->getObject()->keyname,  $textareas)){
                $this->widgetSchema['value'] = new sfWidgetFormTextarea(array(), array('class' => 'mceNoEditor'));
            }else{
                $this->widgetSchema['value'] = new sfWidgetFormInputText;
            }
        }

    }

    public function updateDefaultsFromObject() {
        parent::updateDefaultsFromObject();
        if($this->getObject()->datatype == 'enum'){
            $this->setDefault('value', $this->getObject()->getRealValue(true));
        }
    }


    public function updateObject($values = null) {
        if($this->getObject()->datatype == 'enum'){

            $expl = explode('::', $this->getObject()->value);
            parent::updateObject($values);
            $value = $expl[0] . '::' . $this->values['value'];
            $this->getObject()->value = $value;
        }else{
            parent::updateObject($values);
        }
    }
}