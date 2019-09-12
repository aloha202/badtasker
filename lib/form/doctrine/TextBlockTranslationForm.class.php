<?php

/**
 * TextBlockTranslation form.
 sfDoctrineFormGenerator *
 * @package    cms
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class TextBlockTranslationForm extends BaseTextBlockTranslationForm
{
  public function configure()
  {
      $this->noEditor(array('text'));
  }
}
