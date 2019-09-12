  public function executeShow(sfWebRequest $request)
  {
    $this->processPage();
<?php if (isset($this->params['with_doctrine_route']) && $this->params['with_doctrine_route']): ?>
    $this-><?php echo $this->getSingularName() ?> = $this->getRoute()->getObject();
<?php else: ?>
    $this-><?php echo $this->getSingularName() ?> = Doctrine_Core::getTable('<?php echo $this->getModelClass() ?>')->find(array(<?php echo $this->getRetrieveByPkParamsForAction(65) ?>));
    $this->forward404Unless($this-><?php echo $this->getSingularName() ?>);
<?php endif; ?>
    Breadcrumbs::add(array($this-><?php echo $this->getSingularName(); ?>));
    //$this->getResponse()->addTitle($this-><?php echo $this->getSingularName(); ?>->getMetaTitle());      
  }
