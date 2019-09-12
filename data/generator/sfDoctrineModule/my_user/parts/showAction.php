  public function executeShow(sfWebRequest $request)
  {
    $this-><?php echo $this->getSingularName() ?> = $this->getRoute()->getObject();
    $this->processPage('<?php echo $this->getModuleName(); ?>_show', $this-><?php echo $this->getSingularName() ?>);
  }
