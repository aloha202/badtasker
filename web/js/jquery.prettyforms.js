$(function($){
	
		
    $.fn.prettyForms = function(settings){
        settings = jQuery.extend(PrettyFormsManager.settings, settings);
			
        var jQueryMatchedObj = this; // This, in this context, refer to jQuery object
			
        /**
			 * Initializing the plugin
			 */
        Run(this, jQueryMatchedObj);
			
        /**
			 * Start the jQuery NiceIt plugin
			 *
			 * @param object objForm The object (form) which the user wants to stylish
			 * @param object jQueryMatchedObj The jQuery object with all elements matched
			 */
			 
        function Run(objForm, jQueryMatchedObj) {
            for ( var idx = 0; idx < jQueryMatchedObj.length; idx++ ) {				
                var form = $(jQueryMatchedObj[idx]);

                $(form).replaceCheckBoxes(settings);
                $(form).replaceRadioButtons(settings);
                $(form).replaceSelectBoxes(settings);
                $(form).replaceTextareas(settings);
                $(form).replaceButtons(settings);
                $(form).replaceFiles(settings);
                $(form).replaceInputBoxes(settings);
                $(form).replaceSelectboxesM(settings);
            }
        }
    }

    $.fn.replaceCheckBoxes = function(settings)
    {
        var objForm = this;
        $(objForm).find('input[type="checkbox"]').each(function(i, ctrl) {
				
            PrettyFormsManager.hideCtrl(ctrl);
				
				
            var id = 'fmCbx-' + $(objForm).attr('id') + '-' + (i + 1); 
            if($(ctrl).attr('id')) {
                id = 'fmChbx-' + $(ctrl).attr('id');
            }
	    
            var nCtrl = $(settings.checkbox_template);
            nCtrl.attr('id', id);
            $(ctrl).after(nCtrl);
            nCtrl.after(settings.clearing);
				
            //var nCtrl = $('#' + id);
            $(nCtrl).bind('click', function () {
                //ctrl.onclick();
                $(ctrl).click();
                $(ctrl).focus();
            });
            PrettyFormsManager.registerCheckbox(ctrl, nCtrl.get(0), settings);

            $(ctrl).focus(function(){
                PrettyFormsManager.processFocus(this);
            }).blur(function(){
                PrettyFormsManager.processBlur(this);
            });
				
        });
    }

    $.fn.replaceRadioButtons = function(settings) {
        var objForm = this;
        $(objForm).find('input[type="radio"]').each(function(i, ctrl) {
            PrettyFormsManager.hideCtrl(ctrl);

            var id = 'fmRbtn-' + $(objForm).attr('id') + '-' + (i + 1);
				
            if($(ctrl).attr('id')) {
                id = 'fmRbtn-' + $(ctrl).attr('id');
            }
            
            var nCtrl = $(settings.radio_template);
            $(ctrl).after(nCtrl);
				
            $(nCtrl).bind('click', function () {
                $(ctrl).click();
                $(ctrl).focus();
            });

            $(ctrl).focus(function(){
                PrettyFormsManager.processFocus(this);
            }).blur(function(){
                PrettyFormsManager.processBlur(this);
            });

            PrettyFormsManager.registerRadio(ctrl, nCtrl.get(0), settings);
				
        });			
    }

    $.fn.replaceSelectBoxes = function(settings) {
        var objForm = this;
        var cite = 'strong span cite';
		
        $(objForm).find('select').each(function (i, ctrl) {
			
            if($(ctrl).attr('multiple')) {
                return;
            }
            PrettyFormsManager.hideCtrl(ctrl);

            var width = $(ctrl).width();
	    	
	    	
            var id = 'fmCbox-' + $(objForm).attr('id') + '-' + (i + 1);

	    	
            //var selectedTxt = ($(ctrl).find('option:selected').text() != '' ? $(ctrl).find('option:selected').text() : '&nbsp;');
	    var nCtrl = $(settings.select_template)	
            $(ctrl).before(nCtrl);
            $(ctrl).before(settings.clearing);
	    	
            $(nCtrl).width(width);
            //$(nCtrl).swapStyles($(ctrl));
	    	
            /* Define Events  */
	    	
            $(nCtrl).bind('click', function () { 
                if($(this).hasClass(PrettyFormsManager.settings.SELECT_DISABLED_CLASS)){
                    return false;
                }
                $(this).find('ul').show(); 
                var $selected = $(this).find('.' + PrettyFormsManager.settings.OPTION_SELECTED_CLASS);
                if($selected.size()){
                    //					$(this).find('ul').get(0).scrollTop = $selected.prop('offsetTop');
                    //					$(this).find('ul').smoothScroll({offset: $selected.prop('offsetTop')});

                    $(this).find('ul').animate({
                        scrollTop: $selected.prop('offsetTop')
                        });
                }
            });
            $(nCtrl).bind('mouseleave', function () {
                $(this).find('ul').hide();
            });
	    	
            PrettyFormsManager.processSelectOptions(ctrl, nCtrl, settings);
	    	
            $(ctrl).bind('focus', function(){
                PrettyFormsManager.processFocus(this);
            }).bind('blur', function(){
                PrettyFormsManager.processBlur(this);
            });
            nCtrl.bind('click', function(){
                $(ctrl).focus();
            });

            PrettyFormsManager.registerSelect(ctrl, nCtrl.get(0), settings);
        /*
	    	$(ctrl).bind('change', function() {
	    		nCtrl.find(cite).text($(this).find('option:selected').text());	
	    	});
			*/
        });
    }


    $.fn.replaceSelectboxesM = function(settings) {
        var objForm = this;
		
        $(objForm).find('select[multiple]').each(function (i, ctrl) {
	    	
            var width = '100%';
            var height = $(ctrl).height();
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            } 
            PrettyFormsManager.hideCtrl(ctrl);
	    	
            var id = 'fmMsel-' + $(objForm).attr('id') + '-' + (i + 1);
	    	
            if($(ctrl).attr('id')) { 
                id = $(ctrl).attr('id');
                $(ctrl).attr('id', '');
            }
	    	
            $(ctrl).before(settings.selectboxM_template.replace('%id%', id));
	    	
            var nCtrl = $('#' + id);
            nCtrl.after(settings.clearing);

            nCtrl.find('ul').css({
                position: 'relative'
            });
            ctrl._nCtrl = nCtrl.get(0);
	    	
            $(nCtrl).width(width);
            $(ctrl).width('96%');
            $(ctrl).height(height);
            PrettyFormsManager.processSelectOptionsM(ctrl, nCtrl);
	    	
            /* Define Events  */
	    	
            $(ctrl).bind('focus', function () {
                PrettyFormsManager.processFocus(this);
            });
            $(ctrl).bind('blur', function () {
                PrettyFormsManager.processBlur(this);
            });

            PrettyFormsManager.registerSelectM(ctrl, nCtrl.get(0));
            ctrl._selected = $(ctrl).find('option:selected');
            $(ctrl).change(function(){
                var $selected = $(this).find('option:selected');
                if($selected.size() != 0){
                    if($selected.size() == 1){
                        var option = $selected.get(0);
                        var top = PrettyFormsManager.getOptionTop(this, option);
                        $(this._nCtrl).find('ul').animate({
                            scrollTop: top
                        }, 100);
                    }else{
                        var $old_selected = this._selected;
                        if($selected.size() > this._selected.size()){
                            var new_options = [];

                            $selected.each(function(){
                                var opt = this;
                                var isNew = true;
                                $old_selected.each(function(){
                                    if(this.value == opt.value){
                                        isNew = false;
                                        return false;
                                    }
                                });
                                if(isNew){
                                    new_options.push(opt);
                                }
                            });
                            if(new_options.length == 1){
                                var option = new_options.pop();
                                var top = PrettyFormsManager.getOptionTop(this, option);
                                $(this._nCtrl).find('ul').animate({
                                    scrollTop: top
                                }, 100);
                            }
                        }else{
                    }
                    }
                }
                this._selected = $selected;

				
            });
        });
    }

    $.fn.replaceTextareas = function(settings) {
        var objForm = this;
		
        $(objForm).find('textarea.mceNoEditor').each(function (i, ctrl) {
			
            var width = '50%';
            var height = $(ctrl).height();
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            } 
	    	
            var id = 'fmTarea-' + $(objForm).attr('id') + '-' + (i + 1);
            if($(ctrl).attr('id')) {
                id = 'fmTarea-' + $(ctrl).attr('id');
            }
	    	
            $(ctrl).wrap(settings.textarea_template.replace('%id%', id));
            
	    	
            var nCtrl = $('#' + id);
            nCtrl.after(settings.clearing);
            $(nCtrl).width(width);
            $(ctrl).height(height);
	    	
	    	
            $(ctrl).bind('focus', function () {
                PrettyFormsManager.processFocus(this)
            });
            $(ctrl).bind('blur', function () {
                PrettyFormsManager.processBlur(this)
            });

            PrettyFormsManager.registerTextarea(ctrl, nCtrl.get(0));

        });
    }
	
    /*
	 * Run replacement of Buttons
	 */
    $.fn.replaceButtons = function(settings) {
        var objForm = this;
		
        $(objForm).find('button:not(.fmButton, .nodeinteraction)').each(function(i, ctrl) {
            $(ctrl).addClass('fmButton');
			
            if($(ctrl).attr('type').toLowerCase() == 'submit') { 
                $(ctrl).wrapInner('<strong><span></span></strong>');
            } else { 
                $(ctrl).wrapInner('<span><span></span></span>');
            }
			
            $(ctrl).bind('focus', function () {
                $(ctrl).CtrlInFocus();
            });
            $(ctrl).bind('blur', function () {
                $(ctrl).CtrlOutFocus();
            });
        });
    }
	
    /*
	 * Run replacement of File Inputs
	 */
    $.fn.replaceFiles = function(settings) {
        var objForm = this;
		
        $(objForm).find('input[type="file"]').each(function (i, ctrl) {
			
            var width = '50%';
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            } 
	    	
            var id = 'fmFinp-' + $(objForm).attr('id') + '-' + (i + 1);
            if($(ctrl).attr('id')) { 
                id = 'fmFinp-' + $(ctrl).attr('id'); 
            }
            
            $(ctrl).before(settings.filebox_template
                   .replace('%id%', id)
                   .replace('%tabindex%', $(ctrl).attr('tabindex'))
                   .replace('%title%', 'Browse...'));
            $(ctrl).before(settings.clearing);
            $(ctrl).attr('tabindex', 0);
            $(ctrl).addClass('fnFileHidden');
	    	
            var nCtrl = $('#' + id);
	    	
            $(ctrl).appendTo('#' + id + ' span strong');
	    	
            $(nCtrl).width(width);
	    	
            if($(ctrl).attr('disabled')) {
                $(nCtrl).addClass('disabled');
            }
	    	    	
            /* Define Events  */
            $(ctrl).bind('change', function () {
                $(nCtrl).find('cite').text($(this).attr('value'));
            });
	    	
            $(nCtrl).bind('focus', function () {
                $(nCtrl).CtrlInFocus();
            });
            $(nCtrl).bind('blur', function () {
                $(nCtrl).CtrlOutFocus();
            });
        });
    }

    $.fn.replaceInputBoxes = function(settings) {
        var objForm = this;
		
        $(objForm).find('input[type="text"],input[type="password"]').each(function (i, ctrl) {
		
            var width = '50%';
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            }  
	    	
            var id = 'fmInp-' + $(objForm).attr('id') + '-' + (i + 1);
            if($(ctrl).attr('id')) { 
                id = 'fmInp-' + $(ctrl).attr('id'); 
            }
	    	
            $(ctrl).width('100%');
            $(ctrl).wrap(settings.inputbox_template.replace('%id%', id));//
	    	
            var nCtrl = $('#' + id);
            nCtrl.after(settings.clearing);
	    	
            $(nCtrl).width(width);
	    	
            if($(ctrl).attr('disabled')) {
                $(nCtrl).addClass('disabled');
            }
	    	
            $(nCtrl).swapStyles($(ctrl));
	    	
            $(ctrl).bind('focus', function () { 
                PrettyFormsManager.processFocus(this);
            //	    		if($(ctrl).val() == $(ctrl).attr('title')) { $(ctrl).val(''); } 
            //	    		$(nCtrl).CtrlInFocus();
            });
            $(ctrl).bind('blur', function () { 
                PrettyFormsManager.processBlur(this);
            //				if($(ctrl).val() == '') { $(ctrl).val($(ctrl).attr('title')); }
            //				$(nCtrl).CtrlOutFocus();
            });
            PrettyFormsManager.registerInputBox(ctrl, nCtrl.get(0));

        });		
    }

    $.fn.swapStyles = function (objSrc) { // Apply to newely created control old styles (such as margins)
        var styles = new Array('margin-left', 'margin-right', 'margin-top', 'margin-bottom');
		
        $(styles).each(function(idx, property) {
            $(this).css(property, $(objSrc).css( property ));
        });
		
        $(objSrc).addClass('fmZero');
    }

    $.fn.prettyForms_update = function(html){
        this.html(html);
        this.each(function(){
            this.DATA_CHANGED = true;
        });
    }
	
    $.fn.CtrlInFocus = function() {
        $(this).addClass('fmInFocus');
    }		// Apply fmInFocus class when control get focus 
    $.fn.CtrlOutFocus = function() {
        $(this).removeClass('fmInFocus');
    }	// Apply fmInFocus class when control lose focus
});


var PrettyFormsManager = {
    checkboxes: [],
    radios: [],
    selects: [],
    selects_m: [],
    input_boxes: [],
    textareas: [],
    INITIALIZED: false,
    init: function(){
        if(!this.INITIALIZED){
            this.interval = setInterval(function(){
                PrettyFormsManager.interval_callback()		
            }, 50);
            this.INITIALIZED = true;
        }
    },
    interval_callback: function()
    {
        this.updateCheckboxes();	
        this.updateRadios();	
        this.updateSelects();
        this.updateSelectsM();
        this.updateInputBoxes();
        this.updateTextareas();
    },
    

    registerCheckbox: function(ctrl, nCtrl, settings){
        this.checkboxes.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },

    registerRadio: function(ctrl, nCtrl, settings){
        this.radios.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },

    registerSelect: function(ctrl, nCtrl, settings){
        this.selects.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },

    registerSelectM: function(ctrl, nCtrl, settings){
        this.selects_m.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },

    registerInputBox: function(ctrl, nCtrl, settings){
        this.input_boxes.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },

    registerTextarea: function(ctrl, nCtrl, settings){
        this.textareas.push({
            ctrl: ctrl,
            nCtrl: nCtrl,
            settings: settings
        });
    },
    updateSelectsM: function(){
        for(var i = 0; i < this.selects_m.length; i++){
            var obj = this.selects_m[i];
            var selected = [];
            $(obj.ctrl).find('option:selected').each(function(){
                selected.push(this.value);
            });

            $(obj.nCtrl).find('li').removeClass(PrettyFormsManager.settings.OPTION_SELECTED_CLASS);
            $(obj.nCtrl).find('li').each(function(){
                if($.inArray($(this).attr('option'), selected) != -1){
                    $(this).addClass(PrettyFormsManager.settings.OPTION_SELECTED_CLASS);
                }
            });

            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.SELECT_FOCUSED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.SELECT_FOCUSED_CLASS);			
            }
        }
    },

    updateSelects: function(){
        var cite = 'strong span cite';
        for(var i = 0; i < this.selects.length; i++){
            var obj = this.selects[i];		
            $selected = $(obj.ctrl).find('option:selected');
            $(obj.nCtrl).find(cite).text($selected.text());
            $(obj.nCtrl).find('UL LI').removeClass(PrettyFormsManager.settings.OPTION_SELECTED_CLASS).each(function(){
                if($(this).attr('option') == $selected.val()){
                    $(this).addClass(PrettyFormsManager.settings.OPTION_SELECTED_CLASS);
                }
            });
            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.SELECT_FOCUSED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.SELECT_FOCUSED_CLASS);						
            }
            
            if(obj.ctrl.disabled){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.SELECT_DISABLED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.SELECT_DISABLED_CLASS);
            }

            if(obj.ctrl.DATA_CHANGED){
                this.processSelectOptions(obj.ctrl, obj.nCtrl, obj.settings);
                obj.ctrl.DATA_CHANGED = false;
            }
        }
    },

    updateCheckboxes: function()
    {
        for(var i = 0; i < this.checkboxes.length; i++){
            var obj = this.checkboxes[i];
            if($(obj.ctrl).prop('checked')){
                obj.settings.checkbox_process_check(obj);
                //$(obj.nCtrl).addClass(PrettyFormsManager.settings.CHECKBOX_CHECKED_CLASS);
            }else{
                obj.settings.checkbox_process_uncheck(obj);
                //$(obj.nCtrl).removeClass(PrettyFormsManager.settings.CHECKBOX_CHECKED_CLASS);
            }

            if($(obj.ctrl).prop('disabled')){
                obj.settings.checkbox_process_disable(obj);
            }else{
                obj.settings.checkbox_process_enable(obj);                
            }

			
            if(obj.ctrl.FOCUSED){
                obj.settings.checkbox_process_focus(obj);
            }else{
                obj.settings.checkbox_process_blur(obj);
            }
			
        }
    },

    updateRadios: function(){
        for(var i = 0; i < this.radios.length; i++){
            var obj = this.radios[i];
            if($(obj.ctrl).prop('checked')){
                obj.settings.radio_process_check(obj);
            }else{
                obj.settings.radio_process_uncheck(obj);
            }

            if($(obj.ctrl).prop('disabled')){
                obj.settings.radio_process_disable(obj);
            }else{
                obj.settings.radio_process_enable(obj);
            }

            if(obj.ctrl.FOCUSED){
                obj.settings.radio_process_focus(obj);
            }else{
                obj.settings.radio_process_blur(obj);						
            }
			
        }
    },

    updateInputBoxes: function()
    {
        for(var i = 0; i < this.input_boxes.length; i++){
            var obj = this.input_boxes[i];
            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).CtrlInFocus();
            }else{
                $(obj.nCtrl).CtrlOutFocus();
            }

            if(obj.ctrl.disabled){
                $(obj.nCtrl).addClass('disabled');
            }else{
                $(obj.nCtrl).removeClass('disabled');			
            }
        }
    },

    updateTextareas: function()
    {
        for(var i = 0; i < this.textareas.length; i++){
            var obj = this.textareas[i];
            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).CtrlInFocus();
            }else{
                $(obj.nCtrl).CtrlOutFocus();
            }

            if(obj.ctrl.disabled){
                $(obj.nCtrl).addClass('tx-disabled');
            }else{
                $(obj.nCtrl).removeClass('tx-disabled');			
            }
        }
    },

    processFocus: function(elem){
        elem.FOCUSED = true;	
    },
    processBlur: function(elem){
        elem.FOCUSED = false;	
    },

    processSelectOptions: function(ctrl, nCtrl, settings){
        $(nCtrl).find('ul').html('');
        $(ctrl).find('option').each(function (idx, item) {
            var $opt = $(settings.select_option_template.replace('%text%', $(item).text()));
            $opt.attr('option', $(item).attr('value'));
            $(nCtrl).find('ul').append($opt);
        });	
        $(nCtrl).find('li').each(function(num, elem) {
            $(elem).bind('click', function() { 
                $(ctrl).val($(this).attr('option'));
                $(nCtrl).find('ul').fadeOut();
                $(ctrl).change();
            });
        });
    },

    processSelectOptionsM: function(ctrl, nCtrl){
        $(nCtrl).find('ul').html('');
        $(ctrl).find('option').each(function (idx, item) {
            $(nCtrl).find('ul').append('<li option="' + $(item).attr('value') + '">' + $(item).text() + '</li>');
        });	
        $(nCtrl).find('li').click(function(event){
            var val = $(this).attr('option');
            var option = $(ctrl).find('option[value="' + val + '"]');
            if(event.ctrlKey){
                option.prop('selected', !option.prop('selected'));
            }else{
                $(ctrl).find('option').prop('selected', false);
                option.prop('selected', true);
            }
            $(ctrl).focus();
            $(ctrl).change();
        });
    },


    hideCtrl: function(ctrl){
        $(ctrl).css({
            //visibility: 'hidden',
            position: 'absolute',
            left: -20000
        });	
    },

    getOptionTop: function(ctrl, option){
        var li_option = $(ctrl._nCtrl).find('li[option="' + option.value + '"]');
        var li_top = li_option.prop('offsetTop');
        var ul_height = $(ctrl._nCtrl).find('ul').height();
        var li_height = li_option.height();

        var top = li_top - (ul_height - li_height) / 2;
        return top;
    }
	
}
PrettyFormsManager.settings = {
    OPTION_SELECTED_CLASS: 'option-selected',
    SELECT_FOCUSED_CLASS: 'select-focused',
    SELECT_DISABLED_CLASS: 'select-disabled',    
    select_template: '<div class="fmSelect"><strong><span><cite></cite></span></strong><ul></ul></div>',
    select_option_template: '<li>%text%</li>',
    
    //checkbox
    CHECKBOX_CHECKED_CLASS: 'checked',
    CHECKBOX_DISABLED_CLASS: 'chbx-disabled',
    CHECKBOX_FOCUSED_CLASS: 'chbx-focused',    
    checkbox_template: '<b class="fmCheckbox">&nbsp;</b>',
    checkbox_process_check: function(obj){
        $(obj.nCtrl).addClass(obj.settings.CHECKBOX_CHECKED_CLASS);
    },
    checkbox_process_uncheck: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.CHECKBOX_CHECKED_CLASS);        
    },
    checkbox_process_focus: function(obj){
        $(obj.nCtrl).addClass(obj.settings.CHECKBOX_FOCUSED_CLASS);        
    },
    checkbox_process_blur: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.CHECKBOX_FOCUSED_CLASS);
    },
    checkbox_process_disable: function(obj){
        $(obj.nCtrl).addClass(obj.settings.CHECKBOX_DISABLED_CLASS);
    },
    checkbox_process_enable: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.CHECKBOX_DISABLED_CLASS);        
    },


//radio
    RADIO_FOCUSED_CLASS: 'rbtn-focused',
    RADIO_DISABLED_CLASS: 'rbtn-disabled',
    RADIO_CHECKED_CLASS: 'checked',
    radio_template: '<a class="fmRadio">&nbsp;</a>',
    radio_process_check: function(obj){
        $(obj.nCtrl).addClass(obj.settings.RADIO_CHECKED_CLASS);
    },
    radio_process_uncheck: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.RADIO_CHECKED_CLASS);        
    },
    radio_process_focus: function(obj){
        $(obj.nCtrl).addClass(obj.settings.RADIO_FOCUSED_CLASS);        
    },
    radio_process_blur: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.RADIO_FOCUSED_CLASS);
    },
    radio_process_disable: function(obj){
        $(obj.nCtrl).addClass(obj.settings.RADIO_DISABLED_CLASS);
    },
    radio_process_enable: function(obj){
        $(obj.nCtrl).removeClass(obj.settings.RADIO_DISABLED_CLASS);        
    },
    
    inputbox_template: '<span class="fmInput" id="%id%"><span></span></span>',
    textarea_template: '<span class="fmTextarea" id="%id%"><span><span><span></span></span></span></span>',
    selectboxM_template: '<span class="fmMultipleSelect" id="%id%"><span><span><span><ul></ul></span></span></span></span>',
    
    filebox_template: '<a tabindex="%tabindex%" class="fnFileInput" id="%id%"><span><cite>Not Selected ...</cite><strong>%title%</strong></span></a>',
    
    clearing: '<div class="clr prettyforms_clr"></div>'
};
PrettyFormsManager.init();

$(function(){
  // $('form').prettyForms(); 
});
