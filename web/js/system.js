var SystemPopup = {
    last_url: '',
    message_count: 1
};

function system_message_init()
{
    if(!$('.system_message_block').size())
    {
        $(document.body).append("<div class='system_message_block'></div>");
    }
}

function system_message_show(text, type)
{
    /*
    if(!window.wHumanMsg){
        window.wHumanMsg = $('body').wHumanMsg();
    }
    var hm = window.wHumanMsg;
    hm.wHumanMsg(text);
    */
    
    type = type || 'notice';
    var id = 'system_message_' + SystemPopup.message_count;
    var message = ("<div class='system_message system_message_%type%' id='%id%'>%text%</div>")
    .replace('%type%', type)
    .replace('%text%', text)
    .replace('%id%', id)
    ;
    SystemPopup.message_count++;
    $('.system_message_block').show();
    $('.system_message_block').append(message);
    var $message = $('#' + id);
    $message.fadeIn('slow');
    function destroy()
    {
        var $this = $message;
        if($this.parent()){
            $this.fadeOut('slow', function(){
                $this.remove();
                if(!$('.system_message_block .system_message').size()){
                    $('.system_message_block').hide();
                }
            });             
        }
    }
    $message.click(destroy);
    setTimeout(destroy, 3000);
    
}

function system_popup_init()
{
    if(!$('.system_popup_block').size()){
        $(document.body).append("<div class='system_popup_block'><table cellpadding='0' cellspacing='0' class='system_popup_block_table'><tr><td class='system_popup_block_td'>                <div class='system_popup_window'><div class='system_popup_content'>                        </div><div class='system_popup_close'></div></div>                </td></tr></table><div class='system_popup_overlay'></div></div>        ");
    }
    
    $('.system_popup_block').each(function(){
        if(!$(this).hasClass('system_popup_block_initialized')){
           
            $(this).addClass('system_popup_block_initialized');
           
            $(this).find('.system_popup_overlay, .system_popup_close').click(function(){
                system_popup_hide();
            });
           
        } 
    });
    
    $(document).keypress(function(e){
        if(e.keyCode == 27){
            system_popup_hide();
        } 
    });
}

function system_popup_handle_json(resp)
{
    //alert(resp);
    try{
        var ret = false;
        var json = $.parseJSON(resp);
        if(json.redirect){
            system_popup_remote(json.redirect);
            return true;
        }
        if(json.close){
            if(json.timeout){
                setTimeout(system_popup_hide, json.timeout);
            }else{
                system_popup_hide();
            }
                
            return true;
        }
        if(json.resize || json.size){
            var size = json.size || json.resize;
            var s = size.split('x');
            system_popup_resize(s[0], s[1]);
            ret = true;
        }
        if(json.content){
            system_popup_show(json.content);
            ret = true;;
        }
        if(json.reload){
            document.location.href = document.location.href;
            ret = true;
        }
        if(ret){
            return true;
        }
    }catch(e){
    }
    return false;
}

function system_popup_show(content)
{
    $('.system_popup_content').html(content || '');    
    $('.system_popup_block').show();
    $('.system_popup_window').css({
        top:  ($(window).height() - $('.system_popup_window').height()) / 2,
        'margin-left': -($('.system_popup_window').width() / 2)
    });
    
    system_init_content($('.system_popup_content'));
    
    $('.system_popup_content').find('form').submit(function(){
        var url = $(this).prop('action') || SystemPopup.last_url;
        var method = $(this).prop('method') || 'get';
        $[method](url, $(this).serialize(), function(resp){
            if(!system_popup_handle_json(resp)){
                system_popup_show(resp); 
            }
        });
        system_popup_show(system_loading_gif());
       
        return false;
    });
    $('.system_popup_content').find('form input[type="submit"]').click(function(){
        if(this.name){
            $(this.form).append("<input type='hidden' name='" + this.name + "' value='" + this.value + "' />");
            this.name = '';
        }
    });

}

function system_popup_hide()
{
    $('.system_popup_block').hide();
}

function system_popup_resize(w, h){
    $('.system_popup_window').css({
        width: w, 
        height: h 
    });
    $('.system_popup_window').css({
        top:  ($(window).height() - $('.system_popup_window').height()) / 2
    });    
}

function system_popup_remote(url, params, callback)
{
    
    system_popup_show(system_loading_gif());
    
    $.get(url, params || {}, function(resp){
        if(!system_popup_handle_json(resp)){       
            system_popup_show(resp);
        }
        SystemPopup.last_url = url;          
        if(callback){
            callback(resp);
        }          
           
        
    });
    
}

function system_loading_gif()
{
    return "<div class='system_loading'><img src='/images/system/system_loading.gif' alt='' title='' /></div>";
}

function system_loading_small()
{
    return "<div class='system_loading_small'><img src='/images/system/ajax-loader.gif' alt='' title='' /></div>";
}


function system_init_content($root)
{
    ($root || $('body')).find('a.submit').click(function(){
        $(this).parents('form').submit();
        return false; 
    });    
    ($root || $('body')).find('table.system_zebra, .table_view table').each(function(){
        $(this).find('tr:even').addClass('system_even') 
    });
    
    //alert(($root || $('body')).find('.system_popup_link').size());
    ($root || $('body')).find('.system_popup_link').click(function(){
        if($(this).hasClass('sustem_popup_confirm')){
            if(!confirm('Вы уверены?')){
                return false;
            }
        }
        system_popup_remote(this.href);
        return false;
    });   
    ($root || $('body')).find('.system_block_remote_form').each(function(){
        var $this = $(this);
        init_system_block_remote_form($this);

    });    
    
    if(window.phImageBuilderWidget){
        var phImageBuilder = new phImageBuilderWidget();
        phImageBuilder.init($root);        
    }
    if(window.__init_content){
        window.__init_content($root);
    }    
}

function init_system_block_remote_form($this)
{
    var w = $this.width();
    var h = $this.height();
    $this.css({
        width: w, 
        height: h
    });
    $this.find('form').submit(function(){
        var url = $(this).prop('action');
        var method = $(this).prop('method') || 'get';
        $[method](url, $(this).serialize(), function(resp){
            if(!system_popup_handle_json(resp)){
                $this.html(resp);
                init_system_block_remote_form($this);
                system_init_content($this);
            }
        });
        $this.html(system_loading_gif());
        //system_popup_show(system_loading_gif());

        return false;           
    });    
}

$(function(){
    system_popup_init();
    
    system_message_init();
    
    
    $('.video iframe').each(function(){
        $(this).prop('src', $(this).prop('src') + '?wmode=opaque');
        $(this).css({
            width: 600, 
            height: 600
        });
    });
    
    
    system_init_content();
    if($('.sysmessok').size()){
        system_message_show($('.sysmessok').text());
		$('.sysmessok').remove();
    }    
    
    $(document).dblclick(function(){
        //       system_popup_show('hello, world'); 
        });
})


function __confirm(val)
{
    return window.confirm(__(val));
}

function __(val){
    return val;
}



function Wait(object, property, callback, config){
    config = $.extend(Wait._defaults, (config || {}));
    var interval;
    var time = 0;
    interval = setInterval(function(){
        if(typeof object[property] != 'undefined'){
            callback(object[property]);
            clearInterval(interval);
        }
        time += config.interval;
        if(time >= config.max_time){
            clearInterval(interval);
            if(config.callback_break){
                config.callback_break(object);
            }
        }
    }, config.interval);
}
Wait._defaults = {
    callback_break: null,
    interval: 100,
    max_time: 5000
}

    jQuery.parseParams = function(query) {
        var re = /([^&=]+)=?([^&]*)/g;
        var decodeRE = /\+/g; // Regex for replacing addition symbol with a space
        var decode = function (str) {return decodeURIComponent( str.replace(decodeRE, " ") );};        
        var params = {}, e;
        while ( e = re.exec(query) ) {
            var k = decode( e[1] ), v = decode( e[2] );
            if (k.substring(k.length - 2) === '[]') {
                k = k.substring(0, k.length - 2);
                (params[k] || (params[k] = [])).push(v);
            }
            else params[k] = v;
        }
        return params;
    };