<?php

/**
 * WebsiteProject form.
 sfDoctrineFormGenerator *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class WebsiteProjectForm extends BaseWebsiteProjectForm
{
  public function configure()
  {
      $this->noEditor(['codebase_input']);

      $this->widgetSchema->setHelp('codebase_file', 'Place files under /data/codebase');

      $this->widgetSchema['website_id']->setOption('add_empty', 'All websites')
        ->setOption('query', Q::c('Website', 'w')->orderBy('w.namespace ASC'));
  }
}
