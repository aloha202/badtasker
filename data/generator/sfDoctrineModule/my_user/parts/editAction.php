  public function executeEdit(sfWebRequest $request)
  {
        $this-><?php echo $this->getSingularName(); ?> = $this->getRoute()->getObject();
        $this->forward404Unless($this-><?php echo $this->getSingularName(); ?>->isMy());
        $this->form = new <?php echo $this->getModelClass().'Form' ?>($this-><?php echo $this->getSingularName(); ?>);
        $this->processPage('<?php echo $this->getModuleName(); ?>_edit', $this-><?php echo $this->getSingularName(); ?>);
  }
