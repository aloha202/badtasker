<div class="row">

    <?php foreach($Tasks as $Task): ?>
        <div class="col-md-6">
            <div class="box box-default">
                <div class="box-header with-border">
                    <?php if($Task->is_failed): ?>
                    <i class="fa fa-thumbs-down"></i>
                        <?php else: ?>
                        <i class="fa fa-thumbs-up"></i>
                    <?php endif; ?>
                    <h3 class="box-title"><?php echo $Task->getName(); ?></h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <p><?php echo $Task->getDescription(); ?></p>
                    <dl class="dl-horizontal">
                        <dt>Дедлайн</dt>
                        <dd><?php echo format_date($Task->deadline, 'D'); ?></dd>
                        <dt>Поставил</dt>
                        <dd><?php echo $Task->getUser()->getUsername(); ?></dd>
                        <?php if($Task->is_failed): ?>
                        <dt>Провалил</dt>
                        <?php else: ?>
                            <dt>Выполнил</dt>
                        <?php endif; ?>
                        <dd><?php echo $Task->getExecuter()->getUsername(); ?></dd>
                        <?php if($Task->is_failed): ?>
                            <dt>Наказание</dt>
                            <dd><?php echo $Task->getPunishment(); ?></dd>
                            <dt>Коментарий</dt>
                            <dd><?php echo $Task->getPunishmentComment(); ?></dd>
                        <?php else: ?>
                            <dt>Коментарий</dt>
                            <dd><?php echo $Task->getComment(); ?></dd>
                        <?php endif; ?>
                    </dl>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>