  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();
    $this-><?php echo $this->getSingularName(); ?> = $this->getRoute()->getObject();
    $this->forward404Unless($this-><?php echo $this->getSingularName(); ?>->isMy());
    $this-><?php echo $this->getSingularName(); ?>->delete();
    
    $this->redirect('<?php echo $this->getModuleName() ?>/listMy');
  }
