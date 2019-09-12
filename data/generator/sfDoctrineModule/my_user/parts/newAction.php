  public function executeNew(sfWebRequest $request)
  {
    $this->processPage('<?php echo $this->getModuleName(); ?>_new');  
    $this->form = new <?php echo $this->getModelClass().'Form' ?>();
  }
