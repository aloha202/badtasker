$(function(){
   
    $('.table_view>table>tbody>tr:even, .table_view2>table>tbody>tr:even').addClass('even');
   
    sfForm.base_initialize();
    
    FormFormatter.Materialize.init();
    
    $('#authlink').click(function(){
       $('.auth_popup').fadeIn();
       return false; 
    });
   

   
    $('a.submit').click(function(){
        $(this).parents('form').submit();
        return false;
    });
   
    $('.tabs .tab').click(function(){
        $(this).parent().find('.tab').removeClass('current');
        $(this).addClass('current');
        $(this).parent().parent().find('.tab_content').css({
            position: 'absolute',
            left: -10000,
            top: -10000,
            visibility: 'hidden'
        });
        $(this).parent().parent().find('.tab_content_' + $(this).attr('index')).css({
            position: 'relative',
            left: 0,
            top: 0,
            visibility: 'visible'
        });
        
        if($(this).attr('callback')){
            try{
                window[$(this).attr('callback')]();                
            }catch(e){}
        }

    });
    $('.tabs .tab.current').click();  
    
    
    $('.rating.active').each(function(){
        var $this = $(this);
        $(this).find('span').hover(function(){
            var index = Number($(this).attr('index'));
            $this.find('span').each(function(){
                var ind  = Number($(this).attr('index'));
                if(ind <= index){
                    $(this).addClass('over');
                }
            });
        }, function(){
            if(!$this.hasClass('processing')){
                $this.find('span').removeClass('over');
            }
        });
       
        $this.find('a').click(function(){
            $this.addClass('processing');
            $.get(this.href, function(resp){
                $this.html(resp);
                $this.removeClass('active');
            });
            return false;
        });
    });

});


function url_set(name, url)
{
    if(!window.URL){
        window.URL = {};
    }
    window.URL[name] = url;
}

var FormFormatter = {
    Materialize: {
        init: function(){
            this.fixFormErrors();
            this.initCaptcha();
        },
        fixFormErrors: function()
        {
            $('.form-error').each(function(){
               $(this).parents('.input-field').addClass('invalidate');
            });
        },
        initCaptcha: function(){
            $('.input-field').each(function(){
               if($(this).find('img.captcha').size()){
                   $(this).addClass('input-captcha');
               } 
            });
        }
    },
    Bootstrap: {
        init: function(){
            this.fixCheckboxLabels();
            this.fixLabelPosition();
            this.fixFormErrors();
        },
        fixCheckboxLabels: function(){
            $('.control-group input:checkbox').each(function(){
               var $par = $(this).parents('.control-group');
               $par.find('label').addClass('checkbox-label')
               $(this).parent().append($par.find('label'));
            });
        },
        fixLabelPosition: function(){
            $('.form-horizontal .control-group').each(function(){
                var controls_height = $(this).find('.controls').height();
                var label_height = $(this).find('.control-label').height(); 
                var top = (controls_height - label_height) / 2;
                $(this).find('.control-label').css('margin-top', top);
            });            
        },
        fixFormErrors: function()
        {
            $('.form-error').each(function(){
               $(this).parents('.control-group').addClass('errors');
            });
        }
    }
}