[?php use_stylesheets_for_form($form) ?]
[?php use_javascripts_for_form($form) ?]

<div class="sf_admin_form">
    <div class='sf_admin_form_tabs'></div>
  [?php echo form_tag_for($form, '@<?php echo $this->params['route_prefix'] ?>') ?]
    [?php echo $form->renderHiddenFields(false) ?]

    [?php if ($form->hasGlobalErrors()): ?]
      [?php echo $form->renderGlobalErrors() ?]
    [?php endif; ?]

    [?php foreach ($configuration->getFormFields($form, $form->isNew() ? 'new' : 'edit') as $fieldset => $fields): ?]
      [?php include_partial('<?php echo $this->getModuleName() ?>/form_fieldset', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form, 'fields' => $fields, 'fieldset' => $fieldset)) ?]
    [?php endforeach; ?]

    [?php include_partial('<?php echo $this->getModuleName() ?>/form_actions', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form, 'configuration' => $configuration, 'helper' => $helper)) ?]
  </form>
</div>
<?php if($fields = $this->getShowhideFormFields()): ?>
<script type="text/javascript">
    var extra_showhide_form_fields = {};
<?php foreach($fields as $label => $item): ?>
    extra_showhide_form_fields['<?php echo $label; ?>'] = {};
    extra_showhide_form_fields['<?php echo $label; ?>']['toggler'] = '[?php echo $form["<?php echo $item['toggler']; ?>"]->renderId(); ?]';
    extra_showhide_form_fields['<?php echo $label; ?>']['reverse'] = <?php echo isset($item['reverse']) ? 'true': 'false' ?>;		
    var fields = [];
<?php foreach($item['fields'] as $fieldname): ?>
    <?php if(in_array($fieldname[0], array('.', '#'))): //css selector is supposed?>
        fields.push('<?php echo $fieldname; ?>');        
        <?php else: ?>
    fields.push('#[?php echo $form["<?php echo $fieldname; ?>"]->renderId(); ?]');
        <?php endif; ?>
<?php endforeach; ?>
    extra_showhide_form_fields['<?php echo $label; ?>']['fields'] = fields;
<?php endforeach; ?>
        
    $(function(){
       for(var i in extra_showhide_form_fields){
           var item = extra_showhide_form_fields[i];
           $('#' + item.toggler).each(function(){
              var $this = $(this);

              function change(){
                  var func_name = !item.reverse ? ($this.prop('checked') ? 'slideDown' : 'slideUp') : ($this.prop('checked') ? 'slideUp' : 'slideDown');
                  for(var j = 0; j < item.fields.length; j++){
                      var $field = $(item.fields[j]);
                      if(!$field.hasClass('sf_admin_form_row')){
                          $field = $field.parents('.sf_admin_form_row');
                      }
                      $field[func_name]('fast');
                  }
              }
              $this.change(change);
              change();               
           });
       } 
    });
</script>

<?php endif; ?>




<?php if($fields = $this->getShowhideSelects()): ?>

<script type='text/javascript'>
    var extra_showhide_selects = {};
    
    <?php foreach($fields as $label => $item): ?>
        extra_showhide_selects['<?php echo $label; ?>'] = {};
        extra_showhide_selects['<?php echo $label; ?>'].toggler = '#[?php echo $form["<?php echo $item['toggler']; ?>"]->renderId(); ?]';
        
        extra_showhide_selects['<?php echo $label; ?>'].all_fields = [];
        extra_showhide_selects['<?php echo $label; ?>'].fields = {};
        <?php foreach($item['values'] as $key => $values): ?>
            extra_showhide_selects['<?php echo $label; ?>'].fields['<?php echo $key; ?>'] = [];
            <?php foreach($values as $name): ?>
				<?php if(strpos($name, '#') !== false): ?>
                extra_showhide_selects['<?php echo $label; ?>'].fields['<?php echo $key; ?>'].push('<?php echo $name; ?>');
                extra_showhide_selects['<?php echo $label; ?>'].all_fields.push('<?php echo $name; ?>');					
				<?php else: ?>
                extra_showhide_selects['<?php echo $label; ?>'].fields['<?php echo $key; ?>'].push('#[?php echo $form["<?php echo $name; ?>"]->renderId(); ?]');
                extra_showhide_selects['<?php echo $label; ?>'].all_fields.push('#[?php echo $form["<?php echo $name; ?>"]->renderId(); ?]');
				<?php endif; ?>
            <?php endforeach; ?>
        <?php endforeach; ?>
    <?php endforeach; ?>
    
    
    $(function(){
        for(var i in extra_showhide_selects){
            var item = extra_showhide_selects[i];
            $(item.toggler).each(function(){
                var $this = $(this);
                function change(e)
                {
                    if(!e){
                        //first time call, call from document, not user invoked call
                    }
                    $(item.all_fields.toString()).parents('.sf_admin_form_row').hide();
                    if(item.fields[$this.val()]){
                        $(item.fields[$this.val()].toString()).parents('.sf_admin_form_row').show();
                    }                    
                }
                $this.change(change);
                change(false);
            });
        }
    });
</script>
<?php endif; ?>

<?php if($fields = $this->getExtraJavascriptRemotedata()): ?>
    <script type='text/javascript'>
        var remote_data = {};
        <?php foreach($fields as $name => $field): ?>
            remote_data['<?php echo $name; ?>'] = {
                url: '[?php echo url_for("<?php echo $field['url']; ?>"); ?]',
                trigger: '[?php echo $form["<?php echo $field['trigger']; ?>"]->renderId(); ?]'
            } 
            <?php if(!empty($field['fields'])): ?>
            remote_data['<?php echo $name; ?>'].fields = [];
                <?php foreach($field['fields'] as $field_name): ?>
                    remote_data['<?php echo $name; ?>'].fields.push({
                        label: "<?php echo $field_name; ?>",
                        input_id: "[?php echo $form['<?php echo $field_name; ?>']->renderId(); ?]"
                    });
                <?php endforeach; ?>
            <?php endif; ?>
        <?php endforeach; ?>
            
        $(function(){
           for(var i in remote_data){
               var rd = remote_data[i];
               $('#' + rd.trigger).each(function(){
                   var $this = $(this);
                   function change(e)
                   {
                      $.get(rd.url, {value: $this.val()}, function(resp){
                          try{
                              var json = $.parseJSON(resp);
                              for(var j in json){
                                for(var k in rd.fields){
                                    var f = rd.fields[k];
                                    if(f.label == j){
                                        var $ip = $('#' + f.input_id);
                                        if(!$ip.val()){
                                            $ip.val(json[j]);
                                        }
                                    }
                                }
                              }
                          }catch(e){}

                      }) ;                       
                   }
                   change(false);
                   $this.change(change);
               });
           } 
        });
    </script>
    
<?php endif; ?>

<script type='text/javascript'>

    var cookie_name = '[?php echo $sf_context->getModuleName(); ?]_current_fieldset';
    $(function(){
       if($('.sf_admin_form fieldset').size() > 1){
           $('form fieldset').each(function(){
              var $tab = $(("<div class='sf_admin_form_tab' rel='%rel%'>%name%</div>")
                .replace('%rel%', $(this).prop('id'))
                .replace('%name%', $(this).find('h2').text())
                )
                ;
              $('.sf_admin_form_tabs').append($tab);
              $(this).hide();
           });
           
           $('.sf_admin_form_tabs .sf_admin_form_tab').each(function(){
              $(this).click(function(){
                 $('.sf_admin_form fieldset').hide();
                 $('.sf_admin_form_tab').removeClass('sf_admin_form_tab_active');
                 
                 $(this).addClass('sf_admin_form_tab_active');
                 $('#' + $(this).attr('rel')).show();
                 
                 $.cookie(cookie_name, $(this).attr('rel'));
              });
           });
           
           if($.cookie(cookie_name)){
               $('.sf_admin_form_tabs .sf_admin_form_tab[rel="' + $.cookie(cookie_name) + '"]').click();
           }else{
               $('.sf_admin_form_tabs .sf_admin_form_tab:first-child').click();
           }
       }
    });

</script>


<?php if($validation = $this->getAjaxFormValidation()): ?>

<script type='text/javascript'>

    $(function(){
       var url = '[?php echo url_for("util/ajaxFormValidator"); ?]';
       var form_class = '[?php echo $configuration->getFormClass(); ?]';
       var model = '<?php echo $this->getModelClass(); ?>';
       var model_id = '[?php echo $form->isNew() ? "" : $form->getObject()->getId(); ?]';
       
       var csrf_token = $('#[?php echo $form[$form->getCSRFFieldName()]->renderId(); ?]').val();
       
       
       <?php foreach($validation['fields'] as $field): ?>
        $('#[?php echo $form["<?php echo $field; ?>"]->renderId(); ?]').change(function(){
           var field_name = '<?php echo $field; ?>';
           var $this = $(this);
           var $par = $this.parents('.sf_admin_form_row');
           $par.addClass('loading');
           $.get(url, {
               model: model,
               model_id: model_id,
               form_class: form_class,
               field_name: field_name,
               field_value: $this.val(),
               csrf_token: csrf_token
           }, function(json){
               if(json.result == 1){
                   $par.removeClass('errors');
                   $par.find('.sf_admin_form_errors').html('');
                   $par.addClass('validationOk');
               }else{
                   $par.addClass('errors');
                   $par.removeClass('validationOk');
                   $par.find('.sf_admin_form_errors').html("<ul class='error_list'><li>" + json.message + "</li></ul>");
               }
               $par.removeClass('loading');
           });
        });
       <?php endforeach; ?>
       
    });

</script>

<?php endif; ?>

[?php include_partial('<?php echo $this->getModuleName() ?>/form_extra', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form)) ?]