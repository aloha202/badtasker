<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsClearData
 *
 * @author Алекс
 */
class sfLocalizationExtractTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('lang', sfCommandArgument::REQUIRED, 'Language'),
        ));
        $this->addOptions(array(
          new sfCommandOption('only-create', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates page also', false),        
        ));        
        $this->namespace = 'localization';
        $this->name = 'extract';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $config = sfYaml::load(sfConfig::get('sf_config_dir'). '/localization.yml');
        
        
        
        $count = array(
          'created' => 0, 'updated' => 0, 'skipped' => 0  
        );
        foreach($config['objects'] as $model_name => $local)
        {
            if(!empty($local['fields'])){
                $fields = $local['fields'];
                $q = Q::c($model_name, 'a')
                        ;
                if(!empty($local['query_builder'])){
                    $q = call_user_method($local['query_builder'], $this, $q);
                }
                $objects = $q->execute();
                foreach($objects as $object)
                {
                    foreach($fields as $field)
                    {
                        $status = LocalizationTable::localize($model_name, $object, $field, $arguments['lang'], $options);
                        $count[$status]++;
                    }
                }
            }elseif(!empty($local['localizator'])){
                //$res = call_user_method($local['localizator'], $this);
            }
        }
        $this->logSection("localization", "{$count['created']} created, {$count['updated']} updated, {$count['skipped']} skipped!");
    }
    
    public function configQuery($q)
    {
        $a = $q->getRootAlias();
        return $q->addWhere("$a.is_localized = ?", true);
    }
}
