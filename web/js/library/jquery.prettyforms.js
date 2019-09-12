$(function($){
	
		
    $.fn.prettyForms = function(settings){
        settings = jQuery.extend({ // Settings
            Version: 		'1.0'
        }, settings);
			
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

                $(form).replaceCheckBoxes();
                $(form).replaceRadioButtons();
                $(form).replaceSelectBoxes();
                $(form).replaceTextareas();
                $(form).replaceButtons();
                $(form).replaceFiles();
                $(form).replaceInputBoxes();
                $(form).replaceSelectboxesM();
            }
        }
    }

    $.fn.replaceCheckBoxes = function()
    {
        var objForm = this;
        $(objForm).find('input[type="checkbox"]').each(function(i, ctrl) {
				
            PrettyFormsManager.hideCtrl(ctrl);
				
				
            var id = 'fmCbx-' + $(objForm).attr('id') + '-' + (i + 1); 

            if($(ctrl).attr('id')) {
                id = 'fmChbx-' + $(ctrl).attr('id');
            }
							
            $(ctrl).after('<b class="fmCheckbox" id="' + id + '">&nbsp;</b>');
				
            var nCtrl = $('#' + id);
            $(nCtrl).bind('click', function () {
                $(ctrl).click();
                $(ctrl).focus();
            });
            PrettyFormsManager.registerCheckbox(ctrl, nCtrl.get(0));

            $(ctrl).focus(function(){
                PrettyFormsManager.processFocus(this);
            }).blur(function(){
                PrettyFormsManager.processBlur(this);
            });
				
        });
    }

    $.fn.replaceRadioButtons = function() {
        var objForm = this;
        $(objForm).find('input[type="radio"]').each(function(i, ctrl) {
            PrettyFormsManager.hideCtrl(ctrl);

            var id = 'fmRbtn-' + $(objForm).attr('id') + '-' + (i + 1);
				
            if($(ctrl).attr('id')) {
                id = 'fmRbtn-' + $(ctrl).attr('id');
            }

            $(ctrl).after('<a rel="' + $(ctrl).attr('name') + '" class="fmRadio' + ($(ctrl).attr('checked') ? ' checked' : '') + '" id="' + id + '">&nbsp;</a>');
				
            var nCtrl = $('#' + id);
            $(nCtrl).bind('click', function () {
                $(ctrl).click();
                $(ctrl).focus();
            });

            $(ctrl).focus(function(){
                PrettyFormsManager.processFocus(this);
            }).blur(function(){
                PrettyFormsManager.processBlur(this);
            });

            PrettyFormsManager.registerRadio(ctrl, nCtrl.get(0));
				
        });			
    }

    $.fn.replaceSelectBoxes = function() {
        var objForm = this;
        var cite = 'strong span cite';
		
        $(objForm).find('select').each(function (i, ctrl) {
			
            if($(ctrl).attr('multiple')) {
                return;
            }
            PrettyFormsManager.hideCtrl(ctrl);

            var width = $(ctrl).width();
	    	
            /*
	    	if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
		    	width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
	    	}
			*/
	    	
            var id = 'fmCbox-' + $(objForm).attr('id') + '-' + (i + 1);
	    	
            /*
	    	if($(ctrl).attr('id')) { 
	    		id = $(ctrl).attr('id');
	    		$(ctrl).attr('id', '');
	    	}
			*/
	    	
            //$(ctrl).width('100%');
	    	
            var selectedTxt = ($(ctrl).find('option:selected').text() != '' ? $(ctrl).find('option:selected').text() : '&nbsp;');
	    	
            $(ctrl).before('<div class="fmSelect" id="' + id + '"><strong><span><cite>' + selectedTxt + '</cite></span></strong><ul></ul></div>');
            //$(ctrl).attr('tabindex', '');
            //	    	$(ctrl).hide();
	    		
            var nCtrl = $('#' + id);
	    	
            $(nCtrl).width(width);
            //$(nCtrl).swapStyles($(ctrl));
	    	
            /* Define Events  */
	    	
            $(nCtrl).bind('click', function () { 
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
	    	
            /*
			$(nCtrl).bind('focus', function () { 
	    		$('body').focus();
	    		$('.fmSelect').css('z-index', '100');
	    		$(nCtrl).css('z-index', '1500'); 
	
	    		$(this).CtrlInFocus();
	    	});
			*/
	    	
            //$(nCtrl).bind('blur', function () { $(this).CtrlOutFocus(); });
	    	
            PrettyFormsManager.processSelectOptions(ctrl, nCtrl);
	    	
            $(ctrl).bind('focus', function(){
                PrettyFormsManager.processFocus(this);
            }).bind('blur', function(){
                PrettyFormsManager.processBlur(this);
            });
            nCtrl.bind('click', function(){
                $(ctrl).focus();
            });

            PrettyFormsManager.registerSelect(ctrl, nCtrl.get(0));
        /*
	    	$(ctrl).bind('change', function() {
	    		nCtrl.find(cite).text($(this).find('option:selected').text());	
	    	});
			*/
        });
    }


    $.fn.replaceSelectboxesM = function() {
        var objForm = this;
		
        $(objForm).find('select[multiple]').each(function (i, ctrl) {
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            } 
            PrettyFormsManager.hideCtrl(ctrl);
	    	
            var id = 'fmMsel-' + $(objForm).attr('id') + '-' + (i + 1);
	    	
            if($(ctrl).attr('id')) { 
                id = $(ctrl).attr('id');
                $(ctrl).attr('id', '');
            }
	    	
            $(ctrl).before('<span class="fmMultipleSelect" id="' + id + '"><span><span><span><ul></ul></span></span></span></span>');
	    	
            var nCtrl = $('#' + id);

            nCtrl.find('ul').css({
                position: 'relative'
            });
            ctrl._nCtrl = nCtrl.get(0);
	    	
            PrettyFormsManager.processSelectOptionsM(ctrl, nCtrl);
            var height = $(ctrl).height();
            $(nCtrl).find('ul').css('height', height)
                .css('width', $(ctrl).width());
	    	
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

    $.fn.replaceTextareas = function() {
        var objForm = this;
		
        $(objForm).find('textarea').each(function (i, ctrl) {
			
            var width = '50%';
            var height = $(ctrl).height();
	    	
            if($(ctrl).css('width') != 'auto' && $(ctrl).parent().css('width') != 'auto') {
                width = Math.ceil( 100 * parseFloat($(ctrl).css('width')) / parseFloat($(ctrl).parent().css('width')) ) + '%';
            } 
	    	
            var id = 'fmTarea-' + $(objForm).attr('id') + '-' + (i + 1);
            if($(ctrl).attr('id')) {
                id = 'fmTarea-' + $(ctrl).attr('id');
            }
	    	
            $(ctrl).wrap('<span class="fmTextarea" id="' + id + '"><span><span><span></span></span></span></span>');
	    	
            var nCtrl = $('#' + id);
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
    $.fn.replaceButtons = function() {
        var objForm = this;
		
        $(objForm).find('button:not(.fmButton)').each(function(i, ctrl) {
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
    $.fn.replaceFiles = function() {
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
	    	
            $(ctrl).before('<a tabindex="' + $(ctrl).attr('tabindex') + '" class="fnFileInput" id="' + id + '"><span><cite>Not Selected ...</cite><strong>' + ($(ctrl).attr('title') != '' ? $(ctrl).attr('title') : 'Browse ...') + '</strong></span></a>');
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

    $.fn.replaceInputBoxes = function() {
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
            $(ctrl).wrap('<span class="fmInput" id="' + id + '"><span></span></span>');
	    	
            var nCtrl = $('#' + id);
	    	
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

    registerCheckbox: function(ctrl, nCtrl){
        this.checkboxes.push({
            ctrl: ctrl,
            nCtrl: nCtrl
        });
    },

    registerRadio: function(ctrl, nCtrl){
        this.radios.push({
            ctrl: ctrl,
            nCtrl: nCtrl
        });
    },

    registerSelect: function(ctrl, nCtrl){
        this.selects.push({
            ctrl: ctrl,
            nCtrl: nCtrl
        });
    },

    registerSelectM: function(ctrl, nCtrl){
        this.selects_m.push({
            ctrl: ctrl,
            nCtrl: nCtrl
        });
    },

    registerInputBox: function(ctrl, nCtrl){
        this.input_boxes.push({
            ctrl: ctrl,
            nCtrl: nCtrl
        });
    },

    registerTextarea: function(ctrl, nCtrl){
        this.textareas.push({
            ctrl: ctrl,
            nCtrl: nCtrl
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

            if(obj.ctrl.DATA_CHANGED){
                this.processSelectOptions(obj.ctrl, obj.nCtrl);
                obj.ctrl.DATA_CHANGED = false;
            }
        }
    },

    updateCheckboxes: function()
    {
        for(var i = 0; i < this.checkboxes.length; i++){
            var obj = this.checkboxes[i];
            if($(obj.ctrl).prop('checked')){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.CHECKBOX_CHECKED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.CHECKBOX_CHECKED_CLASS);
            }

            if($(obj.ctrl).prop('disabled')){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.CHECKBOX_DISABLED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.CHECKBOX_DISABLED_CLASS);
            }

			
            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.CHECKBOX_FOCUSED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.CHECKBOX_FOCUSED_CLASS);						
            }
			
        }
    },

    updateRadios: function(){
        for(var i = 0; i < this.radios.length; i++){
            var obj = this.radios[i];
            if($(obj.ctrl).prop('checked')){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.RADIO_CHECKED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.RADIO_CHECKED_CLASS);
            }

            if($(obj.ctrl).prop('disabled')){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.RADIO_DISABLED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.RADIO_DISABLED_CLASS);
            }

            if(obj.ctrl.FOCUSED){
                $(obj.nCtrl).addClass(PrettyFormsManager.settings.RADIO_FOCUSED_CLASS);
            }else{
                $(obj.nCtrl).removeClass(PrettyFormsManager.settings.RADIO_FOCUSED_CLASS);						
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

    processSelectOptions: function(ctrl, nCtrl){
        $(nCtrl).find('ul').html('');
        $(ctrl).find('option').each(function (idx, item) {
            $(nCtrl).find('ul').append('<li option="' + $(item).attr('value') + '">' + $(item).text() + '</li>');
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
    /*
		$(nCtrl).find('li').each(function(num, elem) {
			$(elem).bind('click', function() { 
				$(ctrl).val($(this).attr('option'));
				$(nCtrl).find('ul').fadeOut();
				$(ctrl).change();
			});
		});
		*/
    },


    hideCtrl: function(ctrl){
        $(ctrl).css({
            //visibility: 'hidden',
            position: 'absolute',
            left: -10000,
            top: -10000
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
    CHECKBOX_CHECKED_CLASS: 'checked',
    CHECKBOX_DISABLED_CLASS: 'chbx-disabled',
    CHECKBOX_FOCUSED_CLASS: 'chbx-focused',
    RADIO_FOCUSED_CLASS: 'rbtn-focused',
    RADIO_DISABLED_CLASS: 'rbtn-disabled',
    RADIO_CHECKED_CLASS: 'checked',
    OPTION_SELECTED_CLASS: 'option-selected',
    SELECT_FOCUSED_CLASS: 'select-focused'
};
PrettyFormsManager.init();
