[?php if ($field->isPartial()): ?]
  [?php include_partial('<?php echo $this->getModuleName() ?>/'.$name, array('type' => 'filter', 'form' => $form, 'attributes' => $attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes)) ?]
[?php elseif ($field->isComponent()): ?]
  [?php include_component('<?php echo $this->getModuleName() ?>', $name, array('type' => 'filter', 'form' => $form, 'attributes' => $attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes)) ?]
[?php else: ?]
  <div class="form-group [?php echo $class ?][?php $form[$name]->hasError() and print ' errors' ?]">
      [?php $attributes = $attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes; 
      $widgetAttributes = $form[$name]->getWidget()->getAttributes();
      $attributes['class'] = !empty($widgetAttributes['class']) ? $widgetAttributes['class'] . ' form-control' : 'form-control';
      ?]      
    
      [?php if($form[$name]->getWidget() instanceof  sfWidgetFormInputCheckbox): ?]
        [?php echo $form[$name]->render($attributes) ?]      
        [?php echo $form[$name]->renderLabel($label) ?]        
      [?php else: ?]
        [?php echo $form[$name]->renderLabel($label) ?]
        [?php echo $form[$name]->render($attributes) ?]
      [?php endif; ?]
      [?php if($form[$name]->hasError()): ?]
        <div class='form-error'>[?php echo $form[$name]->renderError() ?]</div>
      [?php endif; ?]
      

      [?php if ($help): ?]
        <span class="help">[?php echo __($help, array(), '<?php echo $this->getI18nCatalogue() ?>') ?]</span>
      [?php elseif ($help = $form[$name]->renderHelp()): ?]
        <span class="help">[?php echo $help ?]</span>
      [?php endif; ?]
  </div>
[?php endif; ?]
