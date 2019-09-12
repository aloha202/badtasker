<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsTestTask
 *
 * @author Алекс
 */
class sfSvnCleanTask extends sfBaseTask{
    protected function configure() {
        $this->namespace = 'svn';
        $this->name = 'clean';        
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $this->cleanSvn(sfConfig::get('sf_root_dir'));
        //echo 'This is a test';
    }
	
	
	protected function cleanSvn($dir) {
		$d = opendir($dir);
		
		while($f = readdir($d)){
			if(in_array($f, array('.', '..'))){
				continue;
			}
			if($f == '.svn'){
				$this->logSection('svn', "Removing $dir/$f");
				P::recursive_remove_directory($dir . '/' . $f);
			}else{
				if(is_dir($dir . '/' . $f)){
					$this->cleanSvn($dir . '/' . $f);
				}
			}
		}
	}
}
