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
class sfWidgetFormSchemaFormatterMaterialize extends sfWidgetFormSchemaFormatter_Base {

    protected
#$rowFormat       = "<div class='sf_admin_form_row sf_admin_text'>%error%<div>%label% <div class='content'>%field%%help%</div>%hidden_fields%</div></div>\n",
            $rowFormat = "        
            
            
            <div class='input-field'>
            %hidden_fields%
            
            %label%            
                %field%
                %error%
                %help%
            </div>
                    
            
        ",
            $helpFormat = "<span class='help'>%help%</span>",
            $errorRowFormat = '%errors%',
            $errorListFormatInARow = "  %errors%  \n",
            $errorRowFormatInARow = "    <span class='form-error'>%error%</span>\n",
            $namedErrorRowFormatInARow = "    <span class='form-error'>%name%: %error%</span>\n",
            $decoratorFormat = "%content%";



}
