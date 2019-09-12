  public function executeUpdate(sfWebRequest $request)
  {
  
    $this-><?php echo $this->getSingularName(); ?> = $this->getRoute()->getObject();
    $this->forward404Unless($this-><?php echo $this->getSingularName(); ?>->isMy());    
    $this->form = new <?php echo $this->getModelClass().'Form' ?>($this-><?php echo $this->getSingularName(); ?>);

    $this->processForm2($this->form, $request,T::__('Объект успешно изменен'));

    $this->setTemplate('edit');
  }
