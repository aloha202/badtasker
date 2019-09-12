<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EmbeddedCollectionForm
 *
 * @author Алекс
 */
class EmbeddedCollectionForm extends BaseForm {

    public function configure() {
        if (!$parent = $this->getOption('parent')) {
            throw new InvalidArgumentException('No parent object specified!');
        }
        if (!$objects = $this->getOption('objects')) {
            throw new InvalidArgumentException('No objects specified!');
        }
        if (!$model_class = $this->getOption('model_class')) {
            throw new InvalidArgumentException('No model class specified!');
        }
        if (!$validator_schema = $this->getOption('validator_schema')) {
            throw new InvalidArgumentException('No validator schema specified!');
        }
        $form_class = $this->getOption('form_class', $model_class . 'Form');

        foreach ($objects as $i => $object) {
            $form = new $form_class($object);
            $this->embedForm($object, $form);
        }

        $object = new $model_class;
        $object->set(get_class($parent), $parent);
        $form = new $form_class($object);
        $this->embedForm('new', $form);



        $attr = sfContext::getInstance()->getModuleName() . '_add_fields';
        $fields = sfContext::getInstance()->getUser()->getAttribute($attr, array());
        foreach ($fields as $name) {
            $object = new $model_class;
            $object->set(get_class($parent), $parent);
            $form = new $form_class($object);
            $this->embedForm($name, $form);
        }
        sfContext::getInstance()->getUser()->setAttribute($attr, array());


        $this->mergePostValidator($validator_schema);

        $this->widgetSchema->setFormFormatterName('embeddedCollection');
        //$this->validatorSchema->setOption('allow_extra_fields', true);
    }

}
