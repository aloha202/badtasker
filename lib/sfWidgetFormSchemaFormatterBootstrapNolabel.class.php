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
class sfWidgetFormSchemaFormatterBootstrapNolabel extends sfWidgetFormSchemaFormatterBootstrap {

    protected
    #$rowFormat       = "<div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div>\n",
    $rowFormat = "        <div class='control-group'>
            %hidden_fields%
                %field%
            
            %help%
        </div>";



}
