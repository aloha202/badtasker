<?php

/**
 * website_project actions.
 *
 * @package    cms
 * @subpackage website_project
 * @author     Your name here
 * @version    SVN: $Id: components.class.php 23810 2009-11-12 11:07:44Z Alex.Radyuk $
 */
require_once sfConfig::get('sf_cache_dir') . '/' 
        . sfContext::getInstance()->getConfiguration()->getApplication() . '/'
        . sfConfig::get('sf_environment') . '/'
        . 'modules/autoWebsite_project/actions/components.class.php';

class website_projectComponents extends autoWebsite_projectComponents
{
}