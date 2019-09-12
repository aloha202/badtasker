function sfJqueryUploadify(settings, uploadify_settings)
{
    this.settings = settings;
    this.uploadify_settings = uploadify_settings;
    var oThis = this;
    this.uploadify_settings.onComplete = function(event, ID, fileObj, response, data)
    {
        oThis.onComplete(event, ID, fileObj, response, data);
    }
    
    $('#' + this.settings.file_input_id).uploadify(this.uploadify_settings);
    this.hidden_input = $('#' + this.settings.hidden_input_id);
    this.images_holder = $('#' + this.settings.images_holder_id);
    this.values = $.trim(this.hidden_input.val()).split(this.settings.delim);
    
    var oThis = this;
	if(this.values.length)
	{
		$.get(settings.get_objects_url, {model: settings.model, ids: this.values.toString()}, function(resp){
			try{
				var json = $.parseJSON(resp);
				for(var i in json){
					oThis.addItem(json[i]);
				}
			}catch(e){}
		});
	}
    
}

sfJqueryUploadify.prototype.addValue = function(value)
{
    if($.inArray(value, this.values) == -1){
        this.values.push(value);
    }
    this.setValue();
}

sfJqueryUploadify.prototype.removeValue = function(value)
{
    var values = [];
    $(this.values).each(function(){
        if(this != value){
            values.push(this);
        } 
    });
    this.values = values;
    this.setValue();
}

sfJqueryUploadify.prototype.setValue = function()
{
    this.hidden_input.val(this.values.join(this.settings.delim));
}

sfJqueryUploadify.prototype.resetValue = function()
{
    var values = [];
    this.images_holder.find('img.sf_uploadify_image').each(function(){
        values.push($(this).attr('value'));
    });
    this.values = values;
    this.setValue();
}

sfJqueryUploadify.prototype.onComplete = function(event, ID, fileObj, response, data)
{
     var json = $.parseJSON(response);       
     this.addItem(json);
    
    this.values.push(json.id);
    this.setValue();
};

sfJqueryUploadify.prototype.addItem = function(json){
    
    var img = "<img src='" + json.filepath + "' value='" + json.id+ "' class='sf_uploadify_image' />";
    var remove_url = this.settings.remove_url + "?id=" + json.id;
    var tpl = this.settings.template_image;
    var html = tpl.replace('%image%', img).replace('%remove_url%', remove_url);
	var item = $(html);
    this.images_holder.prepend(item);

    var oThis = this;
    item.find('a.remove').click(function(e){
       if(!this.CLICKED){
           $.get(this.href);

           $(this.parentNode).remove();
           oThis.resetValue();    
           this.CLICKED = true;
       } 
       e.stopPropagation();
       return false;
    });     

	var settings = this.settings;
	if(settings.edit_url){
		item.find('a.edit').prop('href', settings.edit_url + '?id=' + json.id + '&model=' + settings.model);
	}
}