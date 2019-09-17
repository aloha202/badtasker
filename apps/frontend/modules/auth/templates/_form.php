<form class="form-horizontal" action='<?php echo url_for('auth/signin'); ?>' method="POST">
    <fieldset>
        <?php echo $form; ?>

        <div class='control-group'>
            <div class='controls'>
                <?=__('Войти с помощью:') ?>
                <a href='<?php echo url_for('@oauth?type=facebook'); ?>' target='_blank'><img src='/images/oauth_facebook.png' alt='' /></a>
                <a href='<?php echo url_for('@oauth?type=vkontakte'); ?>' target='_blank'><img src='/images/oauth_vkontakte.png' alt='' /></a>
                <a href='<?php echo url_for('@oauth?type=google'); ?>' target='_blank'><img src='/images/oauth_google.png' alt='' /></a>
                <a href='<?php echo url_for('@oauth?type=yandex'); ?>' target='_blank'><img src='/images/oauth_yandex.png' alt='' /></a>
                <a href='<?php echo url_for('@oauth?type=twitter'); ?>' target='_blank'><img src='/images/oauth_twitter.png' alt='' /></a>
                <a href='<?php echo url_for('@oauth?type=mailru'); ?>' target='_blank'><img src='/images/oauth_mailru.png' alt='' /></a>
            </div>
        </div>

        <div class="control-group">
            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success"><?=__('Войти') ?></button>
                <a href='<?php echo url_for('auth/forgotPassword'); ?>'><?=__('Забыли пароль?') ?></a>
                <a href='<?php echo url_for('auth/register'); ?>'><?=__('Регистрация') ?></a>
            </div>
        </div>
    </fieldset>
</form>