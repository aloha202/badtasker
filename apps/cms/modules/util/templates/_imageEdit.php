<?php include_partial('global/flashes'); ?>
<form method='post' action='<?php echo url_for('util/imageEdit?model=' . $model . '&id=' . $id); ?>'>
    
        <?php echo $form; ?>
        
    
    <input type='submit' value='Сохранить' />
</form>