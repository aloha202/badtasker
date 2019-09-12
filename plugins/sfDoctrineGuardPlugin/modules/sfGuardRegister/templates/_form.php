<?php use_helper('I18N') ?>

<div class="form">
    <form method="post" action="<?php echo url_for('@sf_guard_register') ?>">
        <?php echo $form->renderHiddenFields(); ?>
        <div class="input">
            <label>First name</label>
            <div>
                <?php echo $form['first_name']; ?>
            </div>
        </div>
        <div class="input">
            <label>Last name</label>
            <div>
                <?php echo $form['last_name']; ?>
            </div>
        </div>
        <div class="input">
            <label>Email address<?php echo $form['email_address']->renderError(); ?></label>
            <div>
                <?php echo $form['email_address']; ?>
            </div>
        </div>
        <div class="input">
            <label>Username<?php echo $form['username']->renderError(); ?></label>
            <div>
                <?php echo $form['username']; ?>
            </div>
        </div>        
        <div class="input">
            <label>Password<?php echo $form['password']->renderError(); ?></label>
            <div>
                <?php echo $form['password']; ?>
            </div>
        </div>
        <div class="input">
            <label>Password again<?php echo $form['password_again']->renderError(); ?></label>
            <div>
                <?php echo $form['password_again']; ?>
            </div>
        </div> 
        <input type="submit" value="<?php echo __('Register', null, 'sf_guard') ?>" />        
    </form>
</div>