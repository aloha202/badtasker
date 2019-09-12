<?php

require_once dirname(__FILE__).'/../lib/websiteGeneratorConfiguration.class.php';
require_once dirname(__FILE__).'/../lib/websiteGeneratorHelper.class.php';

/**
 * website actions.
 *
 * @package    cms
 * @subpackage website
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class websiteActions extends autoWebsiteActions
{
    public function preExecute()
    {
        $this->forward404Unless($this->getUser()->isSuper());
        parent::preExecute();
    }
}
