<?php

/**
 * text_block actions.
 *
 * @package    cms
 * @subpackage text_block
 * @author     Your name here
 * @version    SVN: $Id: components.class.php 23810 2009-11-12 11:07:44Z Alex.Radyuk $
 */
require_once sfConfig::get('sf_cache_dir') . '/' 
        . sfContext::getInstance()->getConfiguration()->getApplication() . '/'
        . sfConfig::get('sf_environment') . '/'
        . 'modules/autoText_block/actions/components.class.php';

class text_blockComponents extends autoText_blockComponents
{
}