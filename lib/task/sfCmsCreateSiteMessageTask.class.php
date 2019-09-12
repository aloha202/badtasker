<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsGenerateModuleTask
 *
 * @author Алекс
 */
class sfCmsGenerateModuleTask extends sfBaseTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('name', sfCommandArgument::REQUIRED, 'The name of site message'),
    ));

    $this->addOptions(array(
      new sfCommandOption('create-module-action', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates show route', true),        
      new sfCommandOption('module', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates show route', 'default'),                
      new sfCommandOption('action', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates show route', '<default>'),        
    ));

    $this->namespace = 'cms';
    $this->name = 'create-site-message';
    $this->briefDescription = 'Creates new message for a site';

    $this->detailedDescription = <<<EOF
        blabla
EOF;
  }
    
    
    protected function execute($arguments = array(), $options = array())
    {
        #parent::execute($arguments, $options);
        $databaseManager = new sfDatabaseManager($this->configuration);
                $name = $arguments['name'];
                $yaml = sfYaml::load(sfConfig::get('sf_config_dir') . '/app.yml');
                $yaml['all']['site_messages'][$name]= array(
                    'config' => array(), 
                    'title' => ''
                );
                
                $yaml['all']['site_events']['site_message_' . $name] = array(
                    'email_user' => array(
                        'subject' => sfConfig::get('app_site_name') . ': cпасибо за ваше сообщение',
                        'message' => "Мы свяжемся с вами в ближайшее время"
                    ),
                    'email_admin' => array(
                        'subject' => sfConfig::get('app_site_name') . ': создано новое сообщение ' . $name,
                        'message' => "создано новое сообщение $name:<br />%message%"
                    )
                );
                require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/spyc-0.5/spyc.php';
                $str = Spyc::YAMLDump($yaml,2,60);
                file_put_contents(sfConfig::get('sf_config_dir') . '/app.yml', $str);
                
                $this->logSection('cms', 'Site message created');
                $this->logSection('cms', 'Site event created');
                
                ob_start();
                require_once sfConfig::get('sf_data_dir') . '/generator/site_message_form.template';
                $form_code = ob_get_contents();
                $form_code = "<?php\n\n\n\n" . $form_code; 
                file_put_contents(sfConfig::get('sf_lib_dir') . "/form/SiteMessageForm_$name.php", $form_code);
                ob_clean();
                $this->logSection("cms", "Form created");
        
    }
    
    
}
