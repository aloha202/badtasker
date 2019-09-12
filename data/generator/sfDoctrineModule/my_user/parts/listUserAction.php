  public function executeListUser(sfWebRequest $request)
  {
    $this->user = $this->getRoute()->getObject();  
    $this->processPage('<?php echo $this->getModuleName(); ?>_user', $this->user);

    $q = Q::c('<?php echo $this->getModelClass() ?>', 'a')
        ->where('a.user_id = ?', $this->user->getId());
    
    $this->pager = new sfDoctrinePager('<?php echo $this->getModelClass() ?>', 20);
    $this->pager->setQuery($q);
    $this->pager->setPage($request->getParameter('page', 1));
    $this->pager->init();
  }