<?php

/**
 * TextBlock form.
 sfDoctrineFormGenerator *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class TextBlockForm extends BaseTextBlockForm
{
  public function configure()
  {
      $this->embedI18n(array('en', 'ru'));
  }
}
