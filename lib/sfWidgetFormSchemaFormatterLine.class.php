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
class sfWidgetFormSchemaFormatterLine extends sfWidgetFormSchemaFormatter{
  protected
    $rowFormat       = "<div class='line'>%label% %error% <div class='field'>%field%%help%</div>%hidden_fields%</div>\n",
    $helpFormat      = "<span class='help'>%help%</span>",
    $errorRowFormat            = '%errors%',          
    $decoratorFormat = "%content%";
}
