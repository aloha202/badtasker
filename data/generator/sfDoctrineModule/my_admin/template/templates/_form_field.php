[?php if ($field->isPartial()): ?]
  [?php include_partial('<?php echo $this->getModuleName() ?>/'.$name, array('form' => $form, 'attributes' => $attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes)) ?]
[?php elseif ($field->isComponent()): ?]
  [?php include_component('<?php echo $this->getModuleName() ?>', $name, array('form' => $form, 'attributes' => $attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes)) ?]
[?php elseif ($field->isValueFormField()): ?]  
    <div class="[?php echo $class ?]">
      <div>
          <label>[?php echo $label ? $label : sfInflector::humanize($field->getName()); ?]</label>

      <div class="content">
          [?php $value = $form->getObject()->get($name); echo $value ? $value : '&nbsp;' ?]
      </div>        
      </div>
    </div>  
[?php else: ?]
  <div class="[?php echo $class ?][?php $form[$name]->hasError() and print ' errors' ?]">
      <div class='sf_admin_form_errors'>[?php echo $form[$name]->renderError() ?]</div>
    <div>
      [?php echo $form[$name]->renderLabel($label) ?]

      <div class="content">[?php echo $form[$name]->render($attributes instanceof sfOutputEscaper ? $attributes->getRawValue() : $attributes) ?]</div>

      [?php if ($help): ?]
        <div class="help">[?php echo __($help, array(), '<?php echo $this->getI18nCatalogue() ?>') ?]</div>
      [?php elseif ($help = $form[$name]->renderHelp()): ?]
        <div class="help">[?php echo $help ?]</div>
      [?php endif; ?]
    </div>
  </div>
[?php endif; ?]
