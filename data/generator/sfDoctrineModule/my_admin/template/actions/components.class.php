[?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
require_once dirname(__FILE__).'/../lib/form/FormCmsListSingular.class.php';
/**
 * Description of components
 *
 * @author Алекс
 */
abstract class <?php echo $this->getGeneratedModuleName() ?>Components extends sfComponents
{
    public function executeFf()
    {
        $this->form = new <?php echo $this->getModelClass() ?>FormCmsListSingular($this-><?php echo $this->getSingularName() ?>);
        $this->form->configureField($this->field);
    }
    
}
