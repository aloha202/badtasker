<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormSchemaFormatterLine
 *
 * @author Алекс
 */


class sfWidgetFormSchemaFormatterBackend extends sfWidgetFormSchemaFormatter{
  protected
    $rowFormat       = "<div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div>\n",
    $helpFormat      = "<span class='help'>%help%</span>",
    $errorRowFormat            = '%errors%',          
    $decoratorFormat = "%content%";
}
