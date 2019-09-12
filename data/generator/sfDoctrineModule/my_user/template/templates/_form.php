[?php use_stylesheets_for_form($form) ?]
[?php use_javascripts_for_form($form) ?]

<?php $form = $this->getFormObject() ?>
[?php $url = $form->isNew() ? url_for('<?php echo $this->getModuleName(); ?>/create') : url_for('<?php echo $this->getModuleName(); ?>_update', $form->getObject()); ?]
<form action="[?php echo $url; ?]" method="post" [?php $form->isMultipart() and print 'enctype="multipart/form-data" ' ?] class='form-horizontal'>

[?php echo $form ?]
<div class='control-group'>
    <div class='controls'>
        <input type='submit' value="[?php echo __('Save') ?]" class='btn' />
    </div>
</div>
</form>
