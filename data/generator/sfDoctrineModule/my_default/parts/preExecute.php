public function preExecute()
{
      $this->processPage('<?php echo $this->getGeneratedModuleName(); ?>');
}