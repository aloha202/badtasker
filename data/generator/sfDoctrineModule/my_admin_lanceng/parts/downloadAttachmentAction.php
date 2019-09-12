  public function executeDownloadAttachment(sfWebRequest $request)
  {
    $this-><?php echo $this->getSingularName() ?> = $this->getRoute()->getObject();
    $this-><?php echo $this->getSingularName() ?>->sendAttach();
    return sfView::NONE;
  }