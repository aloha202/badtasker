<?php

class sfAssetsCacheCreateTask extends sfBaseTask {

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
        $this->name = 'cache-create';

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
        $file = sfConfig::get('sf_apps_dir') . '/' . $app . '/config/view.yml';
        if (!file_exists($file)) {
            $this->logSection('error', "Could not load file $file");
            die;
        }
        $view_yml = sfYaml::load($file);
        $css_string = "";
        $js_string = "";

        try {
            foreach ($view_yml['default']['stylesheets'] as $css_file) {
                $css_string .= $this->getFileContents($css_file, 'css');
            }
            foreach ($view_yml['default']['javascripts'] as $js_file) {
                $js_string .= $this->getFileContents($js_file, 'js');
            }
        } catch (Exception $e) {
            $this->logSection('error', $e->getMessage());
            die;
        }
        $file = sfConfig::get('sf_web_dir') . '/cache/' . $app;
        try {
            file_put_contents($file . '.css', $css_string);
            $this->logSection('ok', $file . '.css created');
        } catch (Exception $e) {
            $this->logSection('error', $e->getMessage());
        }
        try {
            file_put_contents($file . '.js', $js_string);
            $this->logSection('ok', $file . '.js created');
        } catch (Exception $e) {
            $this->logSection('error', $e->getMessage());
        }
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
