 // $('head').append("<link rel='stylesheet' type='text/css' href='" + CORE_CSS_JQUERY_UI + "' >");
 // $('head').append("<link rel='stylesheet' type='text/css' href='" + CORE_CSS_THEAPP + "' >");


 $('body').append("<div class='TheApp_favelet_core'></div>");
 for(var i = 0; i < Apps.length; i++) {
     var App = Apps[i];
     if(App.hasWindow) {
         $('.TheApp_favelet_core').append(("<div class='TheApp_window TheApp_window-%id%' data-id='%id%'><div class='TheApp_handle'  data-id='%id%'>%appName%<div class='TheApp_minimize'  data-id='%id%'>_</div></div><div class='TheApp_content' data-id='%id%'>%appContent%</div></div>")
             .replace('%appName%', App.name)
             .replace('%appContent%', App.content || '')
             .replace(/%id%/g, App.id));
         $('.TheApp_favelet_core').append(("<div class='TheApp_token TheApp_token-%id%' data-id='%id%'><div><span>%appName%</span></div></div>")
             .replace('%appName%', App.name)
             .replace(/%id%/g, App.id));
     }
 }
// styles

     $('.TheApp_favelet_core').css({});

     $('.TheApp_favelet_core .TheApp_window').css({
         'position': 'fixed',
         'width': '200px',
         'min-height': '300px',
         'overflow': 'auto',
         'background': '#fff',
         'border': 'solid 1px #0A487C',
         'padding': '5px',
         'left': '-500px',
         'top': '-500px',
         'z-index': '10000'
     });

     $('.TheApp_favelet_core .TheApp_window .TheApp_handle').css({
         'background': '#CCC',
         'height': '20px',
         'position': 'relative'
     });

     $('.TheApp_favelet_core .TheApp_window .TheApp_handle .TheApp_minimize').css({
         'position': 'absolute',
         'right': '4px',
         'bottom': '2px',
         'font-size': '16px',
         'cursor': 'pointer'
     });

     $('.TheApp_favelet_core .TheApp_token').css({
         'position': 'fixed',
         'width': '200px',
         'text-align': 'right',
         'padding': '3px',
         'background': '#fff',
         'border': 'solid 1px #0A487C',
         'top': '150px',
         'left': '100px',
         'z-index': '10000',
         'cursor': 'pointer'
     });

     $('.TheApp_favelet_core .TheApp_token div').css({
         'background': '#CCC',
         'padding': '2px'
     });


     $(".TheApp_favelet_core .TheApp_window").draggable({handle: ".TheApp_handle"});

     $(".TheApp_token").click(function () {
         var id = $(this).data('id');
         $(".TheApp_favelet_core .TheApp_window-" + id).animate({
             left: 100,
             top: 100
         }, 500);
         $(".TheApp_token").animate({left: -250}, 500);
     });


     $(".TheApp_favelet_core .TheApp_window .TheApp_minimize").click(function () {
         var id = $(this).data('id');
         $(".TheApp_favelet_core .TheApp_window-" + id).animate({
             left: -500,
             top: -500
         }, 500);
         $(".TheApp_token").each(function () {
            $(this).animate({left: $(this).data('left')}, 500);
         });
     });

 for(var i = 0; i < Apps.length; i++) {
     var App = Apps[i];
     var $content = null;
     if(App.hasWindow) {
         var tokenLeft = -($(".TheApp_token-" + App.id).width() - $(".TheApp_token-" + App.id + " span").width() - 10);
         $(".TheApp_token-" + App.id).css('left', tokenLeft);
         $(".TheApp_token-" + App.id).data('left', tokenLeft);

         var delta = $(".TheApp_token-" + App.id).height() + 10;
         $(".TheApp_token-" + App.id).css('top', 100 + delta * i);

         $content = $('.TheApp_window-' + App.id + ' .TheApp_content');
     }

     if(App.run){
         App.run($content);
     }
 }
     // var $content = $(".TheApp_favelet_core .TheApp_window .TheApp_content");

 