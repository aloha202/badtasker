<?php

class sfAssetsCacheDeleteTask extends sfBaseTask {

    protected
            $outputBuffer = '',
            $errorBuffer = '';

    /**
     * @see sfTask
     */
    protected function configure() {
        $this->addArguments(array(
            new sfCommandArgument('application', sfCommandArgument::REQUIRED)
        ));
        $this->namespace = 'assets';
        $this->name = 'cache-delete';

        /*
          $this->addOptions(array(
          new sfCommandOption('go', null, sfCommandOption::PARAMETER_NONE, 'Do the deployment'),
          new sfCommandOption('rsync-dir', null, sfCommandOption::PARAMETER_REQUIRED, 'The directory where to look for rsync*.txt files', 'config'),
          new sfCommandOption('rsync-options', null, sfCommandOption::PARAMETER_OPTIONAL, 'To options to pass to the rsync executable', '-azC --force --delete --progress'),
          ));
         * 
         */
    }

    /**
     * @see sfTask
     */
    protected function execute($arguments = array(), $options = array()) {
        //$databaseManager = new sfDatabaseManager($this->configuration);
        $app = $arguments['application'];
        $file = sfConfig::get('sf_web_dir') . '/cache/' . $app;
        echo @unlink($file . '.css');
        echo @unlink($file . '.js');        
        
    }

    protected function getFileContents($file, $folder) {
        $contents = "/**** $file ****/\n";
        $contents .= file_get_contents($this->getFilePath($file, $folder));
        $contents .= "\n";
        return $contents;
    }

    protected function getFilePath($file, $folder) {
        if ($this->isExternal($file)) {
            return $file;
        }
        if ($file[0] == '/') {
            return sfConfig::get('sf_web_dir') . $file;
        }
        return sfConfig::get('sf_web_dir') . '/' . $folder . '/' . $file;
    }

    protected function isExternal($file) {
        return strpos($file, 'http://') === 0; //ex
    }

}
