<?php echo page_header('Вход или регистрация'); ?>

<div class='form'>
    <form method="post" action="<?php echo url_for('auth/quick'); ?>">
        <table cellpadding="0" cellspacing="0">
            <?php echo $form; ?>
        </table>
        <input type="submit" value="Вход" class='button' name="enter" />
        &nbsp;&nbsp;&nbsp;
        <input type="submit" value="Регистрация" class='button' name="register" />


    </form>
</div>