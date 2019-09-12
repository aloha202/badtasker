<script type="text/javascript">
    $(document).ready(function() {

      var default_params = {
        'uploader'  : '/sfJqueryUploadifyPlugin/images/uploadify.swf',
        'script'    : '<?php echo url_for('sfUploadify/uploadify'); ?>?model=<?php echo $model; ?>',
        'cancelImg' : '/sfJqueryUploadifyPlugin/images/cancel.png',
        'folder'    : '/uploads',
        'sizeLimit' : <?php echo $sizeLimit; ?>,
        'auto'      : true,
        'onError'   : function(a1, a2, a3, a4){
            setTimeout(function(){
                if(a4.type == 'File Size'){
                    $('.uploadifyError .percentage').html(' - Файл слишком большой. Максималный размер 1M');
                }                      
            }, 100);      
            
        }
      }
      var params = $.extend(default_params, <?php echo sfOutputEscaper::unescape($params); ?>);
      $(['onAllComplete', 'onCancel', 'onCheck', 'onClearQueue', 'onComplete', 'onError', 'onInit', 'onOpen', 'onProgress', 'onQueueFull', 'onSelect', 'onSelectOnce', 'onSWFReady']).each(function(){
         if(typeof params[this] == 'string'){
             params[this] = window[params[this]];
         } 
      });
      
      var settings = {
        file_input_id: '<?php echo $file_input_id; ?>',
        hidden_input_id: '<?php echo $hidden_input_id; ?>',
        delim: '<?php echo $delimiter; ?>',
        remove_url: '<?php echo url_for($remove_action); ?>',
        get_objects_url: '<?php echo url_for($get_objects_action); ?>',
        edit_url: '<?php echo $edit_action ? url_for($edit_action) : ''; ?>',
        template_image: '<?php echo sfOutputEscaper::unescape($template_image); ?>',
        images_holder_id: '<?php echo $images_holder_id; ?>',
        filepath: '/uploads/uploadify/',
        thumb_prefix: 'thumb_',
        model: '<?php echo $model; ?>'
      };
      new sfJqueryUploadify(settings, params);
    });
</script>