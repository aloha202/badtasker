<?php

require_once dirname(__FILE__).'/../lib/website_projectGeneratorConfiguration.class.php';
require_once dirname(__FILE__).'/../lib/website_projectGeneratorHelper.class.php';

/**
 * website_project actions.
 *
 * @package    cms
 * @subpackage website_project
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class website_projectActions extends autoWebsite_projectActions
{
    public function preExecute()
    {
        $this->forward404Unless($this->getUser()->isSuper());
        parent::preExecute();
    }
}
