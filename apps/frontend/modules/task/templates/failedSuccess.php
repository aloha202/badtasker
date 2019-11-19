<div class="row">

    <h2>Провалены <?php echo $User; ?></h2>
    <?php foreach($Tasks as $Task): ?>
    <div class="col-md-6">
        <div class="box box-default">
            <div class="box-header with-border">
                <i class="fa fa-warning"></i>
                <h3 class="box-title"><?php echo $Task->getName(); ?></h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <dl class="dl-horizontal">
                    <dt>Дедлайн</dt>
                    <dd><?php echo format_date($Task->deadline, 'D'); ?></dd>
                    <dt>Поставил</dt>
                    <dd><?php echo $Task->getUser()->getUsername(); ?></dd>
                    <dt>Провалил</dt>
                    <dd><?php echo $Task->getExecuter()->getUsername(); ?></dd>
                    <dt>Описание</dt>
                    <dd><?php echo $Task->getDescription(); ?></dd>
                    <dt>Наказание</dt>
                    <dd><?php echo $Task->getPunishment(); ?></dd>
                </dl>
                <?php if($User->id == $sf_user->getGuardUser()->id): ?>
                    <a class="btn btn-danger btn-xs" href="<?php echo url_for('@task_punishment?id=' . $Task->id); ?>"><i class="fa fa-thumbs-up"></i> Наказание получено</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <?php endforeach; ?>
</div>