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
class sfWidgetFormSchemaFormatterBootstrap extends sfWidgetFormSchemaFormatter_Base {

    protected
#$rowFormat       = "<div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div>\n",
            $rowFormat = "        <div class='control-group'>%hidden_fields%
            %label%
            <div class='controls'>
                        %error%
                %field%
            </div>
                    
            %help%
        </div>",
            $helpFormat = "<span class='help'>%help%</span>",
            $errorRowFormat = '%errors%',
            $errorListFormatInARow = "  %errors%  \n",
            $errorRowFormatInARow = "    <div class='form-error'>%error%</div>\n",
            $namedErrorRowFormatInARow = "    <div class='form-error'>%name%: %error%</div>\n",
            $decoratorFormat = "%content%";



}
