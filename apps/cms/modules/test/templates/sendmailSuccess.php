<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<h1><?php echo __('Test sendmail'); ?></h1>
<div class='sf_admin_form'>
    <form method='post' action='' enctype='multipart/form-data'>

        <?php echo $form; ?>
        
        <ul class='sf_admin_actions'>
            <li class='sf_admin_action'><input type='submit' value='<?php echo __('Send'); ?>' /></li>
        </ul>
    </form>
</div>