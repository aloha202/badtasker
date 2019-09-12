  public function executeNew(sfWebRequest $request)
  {
    $this->form = $this->configuration->getForm();
    $this-><?php echo $this->getSingularName() ?> = $this->form->getObject();
    
    <?php if($form_from_filters = $this->getExtraFormFromFilters()): ?>
    $filters = $this->getFilters();
        <?php foreach($form_from_filters as $field): ?>
    if(!empty($filters['<?php echo $field; ?>'])){
        $this->form->setDefault('<?php echo $field; ?>', $filters['<?php echo $field; ?>']);
    }
        <?php endforeach; ?>
    <?php endif; ?>
  }
