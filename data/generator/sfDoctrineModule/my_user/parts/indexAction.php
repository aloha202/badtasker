  public function executeIndex(sfWebRequest $request)
  {
    $this->processPage('<?php echo $this->getModuleName(); ?>_index');

    $q = Q::c('<?php echo $this->getModelClass() ?>', 'a');
    
    $this->pager = new sfDoctrinePager('<?php echo $this->getModelClass() ?>', 20);
    $this->pager->setQuery($q);
    $this->pager->setPage($request->getParameter('page', 1));
    $this->pager->init();

  }
