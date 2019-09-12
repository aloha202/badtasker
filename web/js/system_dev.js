$(function(){
    
    $('head').append("<link rel='stylesheet' type='text/css' href='/css/system_dev.css' />");
    
    $('.system_dev_handle').click(function(){
       $(this).parent().toggleClass('system_dev_closed');
       $.cookie('system_dev_window', Number(!$(this).parent().hasClass('system_dev_closed')));
       if($(this).parent().hasClass('system_dev_closed')){
           $(this).parent().animate({
              left: -200 
           });
       }else{
           $(this).parent().animate({
              left: 0 
           });
       }
    });
    if(!Number($.cookie('system_dev_window'))){
        $('.system_dev_window').css({left: -200});
        $('.system_dev_window').addClass('system_dev_closed');
    }
    
    $('.system_dev_tab').click(function(){
        $('.system_dev_tab').removeClass('system_dev_tab_active');
        $('.system_dev_tabcontent').hide();
        
        var mark = this.className.split(' ');
        
        mark = mark[mark.length - 1].replace('system_dev_tab_', '');
        
        $('.system_dev_tabcontent_' + mark).show();
        $.cookie('system_dev_tab_active', mark, '/');
        
        $(this).addClass('system_dev_tab_active');
    });
    
    if($.cookie('system_dev_tab_active')){
        $('.system_dev_tab_' + $.cookie('system_dev_tab_active')).click();
    }else{
        $('.system_dev_tab:first-child').click();
    }

    //alert(typeof $.cookie('system_dev_window'));
    
})

