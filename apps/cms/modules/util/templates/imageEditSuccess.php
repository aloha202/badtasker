<div id='sf_admin_container'>
    <div id='sf_admin_content'>
        <?php include_partial('global/flashes'); ?>
        <div class='sf_admin_form'>
            <form method='post' action='<?php echo url_for('util/imageEdit?model=' . $model . '&id=' . $id); ?>'>

                <?php echo $form; ?>


                <input type='submit' value='Сохранить' />
            </form>        
        </div>
    </div>
</div>