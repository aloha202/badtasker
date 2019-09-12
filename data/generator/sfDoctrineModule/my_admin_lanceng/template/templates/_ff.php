
<table cellpadding='0' cellspacing='0'>

    [?php echo $form[$field]->render(); ?]
    [?php echo $form['_csrf_token']->render(); ?]
</table>


<script type='text/javascript'>
    $(function(){
        var url = '[?php echo url_for('<?php echo $this->getModuleName(); ?>/updateField'); ?]';
        url += '?field=[?php echo $field; ?]&id=' + [?php echo $form->getObject()->getId(); ?];
        $('#[?php echo $form[$field]->renderId(); ?]').change(function(){
            var $this = $(this)
            $this.prop('disabled', true);
            var params = {};
            params[this.name] = $(this).val();
            if(this.tagName.toLowerCase() == 'input' && this.type.toLowerCase() == 'checkbox')
            {
                if(!this.checked)
                {
                    delete params[this.name];
                }
            }            
            params[this.name.replace('[?php echo $field; ?]', 'id')] = [?php echo $form->getObject()->getId(); ?];
            params[this.name.replace('[?php echo $field; ?]', '_csrf_token')] = $('#[?php echo $form['_csrf_token']->renderId(); ?]').val();
            var timeout = setTimeout(function(){
                $this.prop('disabled', false);
                alert('[?php echo __('Server is not responding'); ?]');
            }, 5000);
            $.post(url, params, function(resp){
                if(resp == 'true'){
                    system_message_show('[?php echo __('Data saved'); ?]');
                }else if(resp == 'false'){
                    system_message_show('[?php echo __('Error while saving data'); ?]', 'error');
                }else{
                    system_message_show(resp, 'error');
                }
                $this.prop('disabled', false);
                clearTimeout(timeout);
            });
           
        });
    });
</script>