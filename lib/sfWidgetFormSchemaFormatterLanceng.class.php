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
class sfWidgetFormSchemaFormatterLanceng extends sfWidgetFormSchemaFormatterBootstrap {

    protected
#$rowFormat       = "<div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div>\n",

			$errorListFormatInARow = "<div class='form-error alert alert-danger'>  %errors%  </div>\n",
            $errorRowFormatInARow = "    <div>%error%</div>\n",
            $namedErrorRowFormatInARow = "    <div>%name%: %error%</div>\n";



}
