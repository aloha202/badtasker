[?php

require_once(dirname(__FILE__).'/../lib/Base<?php echo ucfirst($this->moduleName) ?>GeneratorConfiguration.class.php');
require_once(dirname(__FILE__).'/../lib/Base<?php echo ucfirst($this->moduleName) ?>GeneratorHelper.class.php');
require_once dirname(__FILE__).'/../lib/form/FormCmsListSingular.class.php';

/**
 * <?php echo $this->getModuleName() ?> actions.
 * <?php echo get_class($this) ?>
 *
 * @package    ##PROJECT_NAME##
 * @subpackage <?php echo $this->getModuleName()."\n" ?>
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: actions.class.php 31002 2010-09-27 12:04:07Z Kris.Wallsmith $
 */
abstract class <?php echo $this->getGeneratedModuleName() ?>Actions extends <?php echo $this->getActionsBaseClass()."\n" ?>
{
  public function preExecute()
  {
    $this->configuration = new <?php echo $this->getModuleName() ?>GeneratorConfiguration();

    if (!$this->getUser()->hasCredential($this->configuration->getCredentials($this->getActionName())))
    {
      $this->forward(sfConfig::get('sf_secure_module'), sfConfig::get('sf_secure_action'));
    }

    $this->dispatcher->notify(new sfEvent($this, 'admin.pre_execute', array('configuration' => $this->configuration)));

    $this->helper = new <?php echo $this->getModuleName() ?>GeneratorHelper();

    parent::preExecute();
  }

<?php include dirname(__FILE__).'/../../parts/indexAction.php' ?>
  
<?php include dirname(__FILE__).'/../../parts/showAction.php' ?>  

<?php if ($this->configuration->hasFilterForm()): ?>
<?php include dirname(__FILE__).'/../../parts/filterAction.php' ?>
<?php endif; ?>

<?php include dirname(__FILE__).'/../../parts/newAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/createAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/editAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/updateAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/deleteAction.php' ?>

<?php if ($this->configuration->getValue('list.batch_actions')): ?>
<?php include dirname(__FILE__).'/../../parts/batchAction.php' ?>
<?php endif; ?>

<?php include dirname(__FILE__).'/../../parts/processFormAction.php' ?>

<?php if ($this->configuration->hasFilterForm()): ?>
<?php include dirname(__FILE__).'/../../parts/filtersAction.php' ?>
<?php endif; ?>

<?php include dirname(__FILE__).'/../../parts/paginationAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/sortingAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/downloadAttachmentAction.php' ?>  
<?php include dirname(__FILE__).'/../../parts/exportAction.php' ?>    
<?php include dirname(__FILE__).'/../../parts/createUserAction.php' ?>   
  
  public function executeUpdateField(sfWebRequest $request)
  {
    $field = $request->getParameter('field');
    $<?php echo $this->getSingularName(); ?> = Doctrine::getTable('<?php echo $this->getModelClass(); ?>')
        ->find($request->getParameter('id'));
        $this->forward404Unless($<?php echo $this->getSingularName(); ?>);
        
        $form = new <?php echo $this->getModelClass(); ?>FormCmsListSingular($<?php echo $this->getSingularName(); ?>);
        $form->configureField($field);
        
        $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
        if($form->isValid())
        {
            $form->save();
            return $this->renderText('true');
        }
        return $this->renderText('false');
  }
  
  
  public function executeRemoveImage(sfWebRequest $request)
  {
        $this->forward404Unless(class_exists('<?php echo $this->getModelClass(); ?>Image'));
        $image = Doctrine::getTable('<?php echo $this->getModelClass(); ?>Image')
            ->find($request->getParameter('id'));
        $this->forward404Unless($image);
        
        $image->delete();
        
        $this->getUser()->setFlash('notice', 'Image deleted');
        if($request->isXmlHttpRequest())
        {
            return $this->renderText('ok');
        }
        return $this->redirect($request->getReferer());
        
  }
  
  <?php // if($this->getTable()->hasTemplate('BackendViewed')): ?>
  public function executeBackendViewedAll(sfWebRequest $request){
     $ids = $request->getParameter('ids');
     if(count($ids)){
        Q::c('<?php echo $this->getModelClass(); ?>', 'a')
            ->whereIn('id', $ids)
            ->update()
            ->set('is_backend_viewed', true)
            ->execute()
            ;    
     }
     return $this->renderText(strip_tags($this->getComponent('util', 'new_messages_count', array('model' => '<?php echo $this->getModelClass(); ?>'))));
  }
  <?php //endif; ?>
}
