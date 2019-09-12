  public function executeListMy(sfWebRequest $request)
  {
    $this->forward404Unless($this->getUser()->isAuthenticated());
    $this->processPage('<?php echo $this->getModuleName(); ?>_my');

    $q = Q::c('<?php echo $this->getModelClass() ?>', 'a')
        ->where('a.user_id = ?', $this->getUser()->getGuardUser()->getId());
    
    $this->pager = new sfDoctrinePager('<?php echo $this->getModelClass() ?>', 20);
    $this->pager->setQuery($q);
    $this->pager->setPage($request->getParameter('page', 1));
    $this->pager->init();
  }
