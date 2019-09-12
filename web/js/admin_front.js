
/*******************************************************************************
 * Copyright (c) 2010 Archer
 * 
 * @package CMS
 * 
 ******************************************************************************
*/

// Current module url
var MODULE_URL = '';

// Current action name
var CUR_ACTION = '';

// Current module name
var CUR_MODULE = '';

// Full base url
var BASE_URL   = '';
                 
$(document).ready
(
    function()
    {
        // Replace all textareas to TinyMce
        
        // CMS design fix
        
        // ImageBuilder widget
        if( $('div [rel=jcrop] > img').length )
        {        
            //var phImageCrop = new phImageCropClass();
            //phImageCrop.init();
            window.phImageBuilder = new phImageBuilderWidget();
//            phImageBuilder.init();            
        }

    }
)
    
var phImageBuilderWidget = function()
{
    // Instance of imgAreaSelect plugin
    var instance = null;
    
    // Alias for this pointer
    var self = null;
    
    // Максимальный размер превью
    this.thumbMaxWidth = 400;
    
    var workSide = '';
    
    this.scale = 1;                                                      
    
    // Current selected thumbnail
    var curThumb = null;
    
    // Zoom value for current thumb and big image
    var curZoom = 1;
    
    // Original width and height
    var realImageSize = {};
         
    this.init = function()
    {
        self = this;
                   
        // Получаем реальный размер исходного изображения
        var $img = $('div [rel=jcrop] > img');
         
        $img.load(function()
        {
            var max = $(this).css('max-width');
            
            $(this).removeAttr("width")
                   .removeAttr("height")
                   .css({ width: "", height: ""})
                   .css('max-width', '10000px');
         
            realImageSize.width = $(this).width();
            realImageSize.height = $(this).height();
            
            $(this).css('max-width', max);
        });
         
        // для тех браузеров, которые подгрузку из кеша не считают загрузкой
        $img.each(function(){
            var src  = $(this).attr('src');
            $(this).attr('src', '');
            $(this).attr('src', src);
        });
        
        
        this.initThumbs();
                                         
        // instance new imgArea object
        $('.jcrop_thumb_container img').click
        (
            function()
            {              
                // Clear current selection if exists
                if( self.curThumb )
                {
                    self.cancelSelection();
                }
                
                self.curThumb = $(this);
                    
                var container = $('.jcrop_thumb_container div[thumbIndex='+self.curThumb.attr('thumbIndex')+']');
                //var original  = $('div [rel=jcrop] > img');
                var original = $($(this).parents(".jcrop_widget_c").find('img').get(0));
                
                // Show controls
                container.find('.jcrop_label_apply, .jcrop_label_discard').show();
                
                // Fix thumb container size                                                                    
                container.find('.jcrop_label_border').css('width', self.curThumb.width() + 'px');
                container.find('.jcrop_label_border').css('height', self.curThumb.height() + 'px');
                
                var selectedZone = {};
                var aspectRatio = original.width() / original.height();
                var thumbAspectRatio = self.curThumb.width() / self.curThumb.height();
                
                self.curZoom  = 1; // Отношение превью к изображению
                self.realZoom = 1; // Отношение превью к оригиналу изображения
                self.aspectK  = 1; // Относительное увеличение соотношения
                     
                // selected area size                
                selectedZone.width = self.curThumb.width();
                selectedZone.height = self.curThumb.height();
                
                // Scale selected area     
                if( aspectRatio > 1 )
                {
                    // horizontal
                    self.realZoom = realImageSize.height / self.curThumb.height();                     
                    self.curZoom  = original.height() / self.curThumb.height();
                          
                    if( aspectRatio > thumbAspectRatio )
                    {     
                        self.workSide = 'horizontal';
                        self.curThumb.css( 'width', 'auto' );
                        self.curThumb.css( 'height', self.curThumb.height() + 'px' );
                    }
                    else // zoom selected area
                    {
                        self.workSide = 'vertical';
                        self.aspectK = thumbAspectRatio / aspectRatio;
                        selectedZone.width = self.curThumb.width() / self.aspectK;
                        selectedZone.height = self.curThumb.height() / self.aspectK;
                        self.curThumb.css( 'width', self.curThumb.width() + 'px' );
                        self.curThumb.css( 'height', 'auto' );    
                    }
                }
                else
                {
                    //vertical
                    self.realZoom = realImageSize.width / self.curThumb.width();                     
                    self.curZoom  = original.width() / self.curThumb.width();
                    
                    if( aspectRatio < thumbAspectRatio )
                    {
                        self.workSide = 'vertical';
                        self.curThumb.css( 'width', self.curThumb.width() + 'px' );
                        self.curThumb.css( 'height', 'auto' );    
                    }
                    else // zoom selected area
                    {
                        self.workSide = 'horizontal';
                        self.aspectK = aspectRatio / thumbAspectRatio;
                        selectedZone.width = self.curThumb.width() / self.aspectK;
                        selectedZone.height = self.curThumb.height() / self.aspectK;
                        self.curThumb.css( 'width', 'auto' );
                        self.curThumb.css( 'height', self.curThumb.height() + 'px' );
                    }
                }
                   
                // Attach widget
                var maxWidth = parseInt( selectedZone.width * self.curZoom );
                var maxHeight = parseInt( selectedZone.height * self.curZoom );
                var widget = self.curThumb.parents('.jcrop_widget_c');  
                self.instance = $(widget).find('div[rel=jcrop] > img').imgAreaSelect
                (
                    { 
                        parent: $('div[rel=jcrop]'),
                        handles: true,    
                        resizable: false,
                        instance: true,   // enable api functions
                        show: true,       // show area
                        fadeSpeed: 200,
                        resizable: true,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight,
                        aspectRatio: maxWidth + ":" + maxHeight,
                        x1: 0,
                        y1: 0,
                        x2: maxWidth,     // thumb like area
                        y2: maxHeight,    // thumb like area
                        onSelectChange: self.onMoveSelection
                    }
                );   
                
                // Set source image as thumb for crop preview
                self.curThumb.attr( 'source', self.curThumb.attr('src') );
                self.curThumb.attr( 'src', original.attr('src') );
                
                self.__selection_start();
            }
        );                    
        
        // Discard selection
        $('.jcrop_label_discard').click
        ( 
            function()
            {       
                self.cancelSelection();
            } 
        );
        
        // Apply selection
        $('.jcrop_label_apply').click
        ( 
            function()
            { 
                self.saveSelection();
            } 
        );
    }
    
    this.initThumbs = function()
    {
        $('.jcrop_label_border').each
        (
            function()
            {
                var width = $(this).find('img').attr('realWidth');
                var height = $(this).find('img').attr('realHeight');
                var k = (width > self.thumbMaxWidth) ? width / self.thumbMaxWidth : 1;
                
                $(this).find('img').css( 'max-width', '10000px' );
                $(this).find('img').css( 'max-height', '10000px' );               
                $(this).find('img').width( width / k );
                $(this).find('img').height( height / k );
                $(this).width( width / k );
                $(this).height( height / k );
                $(this).parent().width( (width / k)+10 );
                $(this).parent().height( (height / k)+10 );
            }
        );
    }
    
    /**
    * Move or resize selected area
    */
    this.onMoveSelection = function( img, selection )
    {                   
        self.scale = 1;
                                                 
        if( self.workSide == 'horizontal' )
        {               
            self.scale = $('div [rel=jcrop] > img').height() / self.instance.getSelection().height;
            
            var newHeight = self.curThumb.parent().height() * self.scale;
            self.curThumb.height( newHeight );
        }                
        if( self.workSide == 'vertical' )
        {
            self.scale = $('div [rel=jcrop] > img').width() / self.instance.getSelection().width;
            
            var newWidth = self.curThumb.parent().width() * self.scale;
            self.curThumb.width( newWidth );
        }                  
                         
        self.curThumb.css( 'margin-left', (-1)*(selection.x1 / (self.curZoom / (self.scale * self.aspectK))) + 'px' );
        self.curThumb.css( 'margin-top', (-1)*(selection.y1 / (self.curZoom / (self.scale * self.aspectK))) + 'px' );
    }
    
    this.saveSelection = function()
    {
        var selection = self.instance.getSelection(); 
        var name      = self.curThumb.attr('thumbName');
        var action    = self.curThumb.parents('.jcrop_widget_c').attr('callback'); // Callback URL
        var fieldName = self.curThumb.parents('.jcrop_widget_c').find('input').attr('name');
        
        var realX = selection.x1 * ( self.realZoom / self.curZoom );
        var realY = selection.y1 * ( self.realZoom / self.curZoom );
        if(isNaN(realX) || isNaN(realY)){
            alert('Ошибка выделения!');
            return false;
        }
        var formPost = 
        {
            field: fieldName, 
            name: name,       // Thumb name 
            x: realX,
            y: realY,
            scale: self.scale
        };
                 
        self.curThumb.parent().addClass('waiting');
                                                  
        $.post
        (
            action,   
            formPost,
            function()
            {
                var temp = self.curThumb;
                self.cancelSelection();    
                temp.parent().removeClass('waiting');
            }
        );
            
        self.__selection_save();
    }
    
    this.cancelSelection = function()
    {
        $('.jcrop_label_discard').hide(); 
        $('.jcrop_label_apply').hide();
        
        self.curThumb.css( 'margin-left', 0 + 'px' );
        self.curThumb.css( 'margin-top', 0 + 'px' );
        
        this.initThumbs();
        
        if( self.curThumb )
        {                              
            self.curThumb.attr( 'src', self.curThumb.attr('source') + '?rand=' + Math.random() );    
        }
        if( self.instance )
        {
            self.instance.cancelSelection();       
        }
                                               
        self.curThumb = null;
        self.instance = null;
        self.curZoom  = 1;
        self.scale    = 1;
        self.__selection_cancel();
    }

}
phImageBuilderWidget.prototype.__selection_start = function(){
    var self = this;    
    $.each(this._selection_start, function(){
       this(self); 
    });
}
phImageBuilderWidget.prototype.__selection_save = function(){
    var self = this;
    $.each(this._selection_save, function(){
       this(self); 
    });
}
phImageBuilderWidget.prototype.__selection_cancel = function(){
    var self = this;    
    $.each(this._selection_cancel, function(){
       this(self); 
    });
}
phImageBuilderWidget.prototype._selection_start = [];
phImageBuilderWidget.prototype._selection_save = [];
phImageBuilderWidget.prototype._selection_cancel = [];
phImageBuilderWidget.prototype.onSelectionStart = function(callback){
    this._selection_start.push(callback);
};
phImageBuilderWidget.prototype.onSelectionSave = function(callback){
    this._selection_save.push(callback);    
};
phImageBuilderWidget.prototype.onSelectionCancel = function(callback){
    this._selection_cancel.push(callback);    
};    

var clearCache = function( url, message )
{
    alert( message );
    $.post( url, {}, function(){} );
}

/**
* ImgAreaSelect based GUI for ImageBuilder widget
* 
*/
var phImageCropClass = function()
{
    // Instance of imgAreaSelect plugin
    var instance = null;
    // Alias for this pointer
    var self = null;
    
    // Current selected thumbnail
    var curThumb = null;
    // Zoom value for current thumb and big image
    var curZoom = 1;
    
    // Original width and height
    var realImageSize = {};
    
    this.init = function()
    {
        self = this;
        
        var $img = $('div [rel=jcrop] > img');
         
        $img.load(function()
        {
            var max = $(this).css('max-width');
            
            $(this).removeAttr("width")
                   .removeAttr("height")
                   .css({ width: "", height: ""})
                   .css('max-width', '10000px');
         
            realImageSize.width = $(this).width();
            realImageSize.height = $(this).height();
            
            $(this).css('max-width', max);
        });
         
        // для тех браузеров, которые подгрузку с кеша не считают загрузкой, пишем следующий код
        var src  = $img.attr('src');
        $img.attr('src', '');
        $img.attr('src', src);
                                         
        // instance new imgArea object
        $('.jcrop_thumb_container img').click
        (
            function()
            {              
                // Clear current selection if exists
                if( self.curThumb )
                {
                    self.cancelSelection();
                }
                
                self.curThumb = $(this);
                    
                var container = $('.jcrop_thumb_container div[thumbIndex='+self.curThumb.attr('thumbIndex')+']');
                var original  = $('div [rel=jcrop] > img');
                
                // Show controls
                container.find('.jcrop_label_apply, .jcrop_label_discard').show();
                
                // Fix thumb container size                                                                    
                container.find('.jcrop_label_border').css('width', self.curThumb.width() + 'px');
                container.find('.jcrop_label_border').css('height', self.curThumb.height() + 'px');
                
                var selectedZone = {};
                var aspectRatio = original.width() / original.height();
                var thumbAspectRatio = self.curThumb.width() / self.curThumb.height();
                
                self.curZoom = 1;
                self.realZoom = 1;     
                // selected area size                
                selectedZone.width = self.curThumb.width();
                selectedZone.height = self.curThumb.height();
                
                // Scale selected area     
                if( aspectRatio > 1 )
                {
                    // horizontal
                    self.realZoom = realImageSize.height / self.curThumb.height();                     
                    self.curZoom  = original.height() / self.curThumb.height();
                    
                    if( aspectRatio > thumbAspectRatio )
                    {
                        self.curThumb.css( 'width', 'auto' );
                        self.curThumb.css( 'height', self.curThumb.height() + 'px' );
                    }
                    else // zoom selected area
                    {
                        var k = thumbAspectRatio / aspectRatio;
                        selectedZone.width = self.curThumb.width() / k;
                        selectedZone.height = self.curThumb.height() / k;
                        self.curThumb.css( 'width', self.curThumb.width() + 'px' );
                        self.curThumb.css( 'height', 'auto' );    
                    }
                }
                else
                {
                    //vertical
                    self.realZoom = realImageSize.width / self.curThumb.width();                     
                    self.curZoom  = original.width() / self.curThumb.width();
                        
                    if( aspectRatio < thumbAspectRatio )
                    {
                        self.curThumb.css( 'width', self.curThumb.width() + 'px' );
                        self.curThumb.css( 'height', 'auto' );    
                    }
                    else // zoom selected area
                    {
                        var k = aspectRatio / thumbAspectRatio;
                        selectedZone.width = self.curThumb.width() / k;
                        selectedZone.height = self.curThumb.height() / k;
                        self.curThumb.css( 'width', 'auto' );
                        self.curThumb.css( 'height', self.curThumb.height() + 'px' );
                    }
                }
                
                // Attach widget
                var maxWidth = parseInt( selectedZone.width * self.curZoom );
                var maxHeight = parseInt( selectedZone.height * self.curZoom );
                var widget = self.curThumb.parents('.jcrop_widget_c');                  
                self.instance = $(widget).find('div[rel=jcrop] > img').imgAreaSelect
                (
                    { 
                        parent: $('div[rel=jcrop]'),
                        handles: true,    
                        resizable: false,
                        instance: true,   // enable api functions
                        show: true,       // show area
                        fadeSpeed: 200,
                        resizable: true,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight,
                        aspectRatio: maxWidth + ":" + maxHeight,                        
                        x1: 0,
                        y1: 0,
                        x2: maxWidth,     // thumb like area
                        y2: maxHeight,    // thumb like area
                        onSelectChange: self.onMoveSelection
                    }
                );   
                
                // Set source image as thumb for crop preview
                self.curThumb.attr( 'source', self.curThumb.attr('src') );
                self.curThumb.attr( 'src', original.attr('src') );
            }
        );                    
        
        // Discard selection
        $('.jcrop_label_discard').click
        ( 
            function()
            {       
                self.cancelSelection();
            } 
        );
        
        // Apply selection
        $('.jcrop_label_apply').click
        ( 
            function()
            { 
                self.saveSelection();
            } 
        );
    }
    
    /**
    * Move crop preview
    */
    this.onMoveSelection = function( img, selection )
    {
        self.curThumb.css( 'margin-left', (-1)*(selection.x1 / self.curZoom) + 'px' );
        self.curThumb.css( 'margin-top', (-1)*(selection.y1 / self.curZoom) + 'px' );
    }
    
    this.saveSelection = function()
    {
        var selection = self.instance.getSelection();
        var name      = self.curThumb.attr('thumbName');
        var action    = self.curThumb.parents('.jcrop_widget_c').attr('callback'); // Callback URL
        var fieldName = self.curThumb.parents('.jcrop_widget_c').find('input').attr('name');
        
        var formPost = 
        {
            field: fieldName, 
            name: name,       // Thumb name 
            x: selection.x1 * ( self.realZoom / self.curZoom ),
            y: selection.y1 * ( self.realZoom / self.curZoom )
        };
                                                  
        self.curThumb.parent().addClass('waiting');
                                                  
        $.post
        (
            action,   
            formPost,
            function()
            {
                var temp = self.curThumb;
                self.cancelSelection();    
                temp.parent().removeClass('waiting');
            }
        );
    }
    
    this.cancelSelection = function()
    {
        $('.jcrop_label_discard').hide(); 
        $('.jcrop_label_apply').hide();
        
        self.curThumb.css( 'margin-left', 0 + 'px' );
        self.curThumb.css( 'margin-top', 0 + 'px' );
        
        if( self.curThumb )
        {                              
            self.curThumb.attr( 'src', self.curThumb.attr('source') + '?rand=' + Math.random() );    
        }
        if( self.instance )
        {
            self.instance.cancelSelection();       
        }
                                               
        self.curThumb = null;
        self.instance = null;
        self.curZoom = 1;
    }
}


