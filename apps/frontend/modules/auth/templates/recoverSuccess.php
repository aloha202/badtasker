<form class="form-horizontal" action='' method="POST">
    <fieldset>
        <?php if($page->getContent()): ?>
            <?php echo $page->getRaw('content'); ?>
        <?php endif; ?>
        
        <div id="legend">
            <legend class=""><?php echo $page; ?></legend>
        </div>
        <?php echo $form; ?>


        <div class="control-group">
            <!-- Button -->
            <div class="controls controls-center">
                <button class="btn"><?=__('Сменить пароль') ?></button>           
            </div>
        </div>
    </fieldset>
</form>