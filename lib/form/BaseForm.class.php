<?php

/**
 * Base project form.
 * 
 * @package    cms
 * @subpackage form
 * @author     Your name here 
 * @version    SVN: $Id: BaseForm.class.php 20147 2009-07-13 11:46:57Z FabianLange $
 */
class BaseForm extends sfFormSymfony {


    protected $embeddedTextBlocks = array();
    public function setDefaultvalue($name, $value) {
        $this->widgetSchema[$name]->setAttribute('class', 'defaultvalue')
                ->setAttribute('defaultvalue', $value)
        ;
        $this->setDefault($name, $value);
    }

    public function embedLanguages() {
        $this->embedI18N(CmsLanguageTable::getActiveArray());
    }

    public function getWidgetLanguages($widget_name) {
        $langs = CmsLanguageTable::getActiveArray();
        $widgets = array();
        foreach ($langs as $name) {
            $widgets[] = $this->widgetSchema[$name][$widget_name];
        }
        return $widgets;
    }

    public function getAllErrors() {
        $err = array();
        foreach ($this as $form_field) {
            if ($form_field->hasError()) {
                $err_obj = $form_field->getError();
                if ($err_obj instanceof sfValidatorErrorSchema) {
                    foreach ($err_obj->getErrors() as $err) {
                        $err[$form_field->getName()] = $err->getMessage();
                    }
                } else {
                    $err[$form_field->getName()] = $err_obj->getMessage();
                }
            }
        }
        // global err
        foreach ($this->getGlobalErrors() as $validator_err) {
            $err[] = $validator_err->getMessage();
        }
        return $err;
    }

    public function renderRows($rows) {
        $str = '';
        foreach ($rows as $name) {
            $str .= $this[$name]->renderRow();
        }
        return $str;
    }

    public function getUser() {

        return sfContext::getInstance()->getUser();
    }

    public static function disabledFormFields($form) {

        foreach ($form as $name => $field) {
            if ($field instanceof sfFormFieldSchema) {
                self::disabledFormFields($field);
            } else {
                $field->getWidget()->setAttribute('disabled', 'disabled');
            }
        }
    }

    public function setFormFormatterName($name) {
        $this->widgetSchema->setFormFormatterName($name);
    }
	
    public function formatter($name)
    {
        $this->setFormFormatterName($name);
    }

    public function setRequired($field) {
        if(sfConfig::get('app_form_attribute_required', false)){
            $this->widgetSchema[$field]->setAttribute('required', true);
        }else{
            $this->widgetSchema[$field]->setAttribute('required_field', true);
            //adds star to the label without settings required attribute to the field
        }
        $this->validatorSchema[$field]->setOption('required', true);
    }

    public function setRequiredFields($fields) {
        foreach ($fields as $field) {
            $this->setRequired($field);
        }
    }

    public function embedCaptcha($label = false) {
        $this->widgetSchema['captcha'] = new sfWidgetCaptchaGD();

        $this->validatorSchema['captcha'] = new sfCaptchaGDValidator(array(), array('invalid' => 'Код введен неверно'));
        if(P::is_dev()){
            $this->validatorSchema['captcha']->setOption('required', false);
        }else{
            $this->setRequired('captcha');
        }
        if($label){
            $this->widgetSchema->setLabel('captcha', $label);
        }
    }

    public function captcha($label = false) {
        $this->embedCaptcha($label);
    }

    public function embedCalendar($name, $options = array()) {
        $attributes = array('class' => 'datepicker', 'datepicker' => http_build_query($options));
        $this->widgetSchema[$name] = new sfWidgetFormInputText(array(), $attributes);
    }
    
    
    public function setPlaceholdersFromLabels()
    {
        foreach($this->widgetSchema->getLabels() as $key => $label){
            if($label){
                $this->widgetSchema[$key]->setAttribute('placeholder', $label);
            }
        }
    }
    
    public function noEditor($fields)
    {
        if(!is_array($fields)){
            $fields = array($fields);
        }
        foreach($fields as $name){
            $this->widgetSchema[$name]->setAttribute('class', 'mceNoEditor');
        }
    }    
    
    public function getMark()
    {
        $mark = get_class($this);
        if(method_exists($this, 'getObject')){
            $object = $this->getObject();
            if(!$object->isNew()){
                $mark .= $object->getPrimaryKey();
            }
        }
        return $mark;
    }
    
    public function isValid()
    {
        $valid = parent::isValid();
        if($valid){
            $this->clearInvalidAttemptsCount();
        }else{
            $this->incrInvalidAttemptsCount();
        }
        return $valid;
    }
    
    public function incrInvalidAttemptsCount()
    {
        $form_data = $this->getSessionFormData();
        $form_data['invalid_attempts_count'] += 1;
        $this->setSessionFormData($form_data);
    }
    
    public function clearInvalidAttemptsCount()
    {
        $form_data = $this->getSessionFormData();
        $form_data['invalid_attempts_count'] = 0;
        $this->setSessionFormData($form_data);
    }    
    
    public function getInvalidAttemptsCount()
    {
        $form_data = $this->getSessionFormData();
        return $form_data['invalid_attempts_count'];
    }
    
    public function getSessionFormData()
    {
        return $this->getUser()->getAttribute('form_' . $this->getMark(), array(
           'invalid_attempts_count' => 0 
        ));
    }
    
    public function setSessionFormData($data)
    {
        $this->getUser()->setAttribute('form_' . $this->getMark(), $data);
    }
    
    public function embedTextBlocks(array $Blocks, $required = false) {
        $this->embeddedTextBlocks = array_merge($this->embeddedTextBlocks, $Blocks);
        
        foreach($Blocks as $block_name){
            $this->widgetSchema[$block_name] = new sfWidgetFormTextarea;
            $this->validatorSchema[$block_name] = new sfValidatorString(array(
                'required' => $required
            ));
        }
    }
    
    public function disableImageEdit($name) {
        $this->widgetSchema[$name]->setOption('disabled', true);
    }

}
