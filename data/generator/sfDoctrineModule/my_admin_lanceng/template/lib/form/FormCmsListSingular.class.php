[?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of FormFieldSingular
 *
 * @author Алекс
 */
class <?php echo $this->getModelClass(); ?>FormCmsListSingular extends <?php echo $this->getModelClass(); ?>Form{
    public function configure()
    {
        parent::configure();
        $this->widgetSchema->setNameFormat("<?php echo $this->getSingularName(); ?>_{$this->getObject()->getId()}[%s]");
    }
    public function configureField($name)
    {
        $this->useFields(array($name));
    }    
}
