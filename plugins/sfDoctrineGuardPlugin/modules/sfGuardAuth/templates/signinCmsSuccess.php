<script language="javascript">
    
    $(document).ready
    (
        function()
        {
            $('.singin_c').css( 'margin-top', ($(window).height() - $('.singin_c').height()) / 2 + 'px' );    
        }
    );

</script>

<div class="singin_c">
    
    <img src="/images/admin/logo.png" class="logo" alt="Smartweb" />

    <form class="singin_form" method="post" action="<?php echo url_for('@sf_guard_signin') ?>">
            <?php echo $form->renderHiddenFields(); ?>
            <?php echo $form->renderGlobalErrors(); ?>
            <div class="singin_caption">Login</div>
        
            <div class="singin_login">
                <div class="singin_label">Login</div>
                <div class="singin_input">
                    <?php echo $form['username']; ?>
                </div>
                <div style="clear: both">&nbsp;</div>    
            </div>
            <div class="singin_password">
                <div class="singin_label">Password</div>
                <div class="singin_input">
                    <?php echo $form['password']; ?>
                </div>
                <div style="clear: both">&nbsp;</div>    
            </div>
            
            <input type="submit" value="Enter" class="singin_submit" />
        
    </form>
    
</div>