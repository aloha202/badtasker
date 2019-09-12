<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfWidgetFormSchemaFormatterBlank
 *
 * @author Алекс
 */
class sfWidgetFormSchemaFormatterBlank extends sfWidgetFormSchemaFormatter_Base {

    protected
            $rowFormat = "%error%%field%%help%%hidden_fields%\n",
            $errorRowFormat = "%errors%\n",
            $helpFormat = '<br />%help%',
            $errorRowFormatInARow = "    <div class='form-error'>%error%</div>\n",
            $namedErrorRowFormatInARow = "    <div class='form-error'>%name%: %error%</div>\n",
            $decoratorFormat = "<div class='sf_widget_form_schema_formatter_blank'>%content%</div>";

}
