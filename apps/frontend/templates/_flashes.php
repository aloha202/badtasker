<div class="my-fixed">
    <?php if ($sf_user->hasFlash('notice')): ?>
<div class="alert alert-success alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <h4>	<i class="icon fa fa-check"></i> Готово!</h4>
    <?php echo $sf_user->getFlash('notice') ?>
</div>
    <?php endif; ?>
    <?php if ($sf_user->hasFlash('error')): ?>
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4>	<i class="icon fa fa-check"></i> Ошибка!</h4>
        <?php echo __($sf_user->getFlash('error')) ?>
    </div>
    <?php endif; ?>
</div>
