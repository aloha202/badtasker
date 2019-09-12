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


class sfWidgetFormSchemaFormatterBackendTableRow extends sfWidgetFormSchemaFormatterTable{
  protected
    $helpFormat      = "<span class='help'>%help%</span>",
    $errorRowFormat            = '%errors%',          
    $rowFormat       = "<td><div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div></td>\n",
    $decoratorFormat = "<table class='sf_widget_form_schema_formatter_backend_table_row'><tr>\n  %content%</tr></table>";  
}
