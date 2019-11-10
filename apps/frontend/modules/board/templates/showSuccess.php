<div class="timeline-wrapper">
<ul class="timeline">

    <?php $curDate = '1970-01-01'; ?>
    <?php foreach($Tasks as $Task): ?>
        <?php if($Task->deadline != $curDate):
            $curDate = $Task->deadline;
            ?>

    <li class="time-label">
        <span class="<?php echo $Task->getTimelineCssClass(); ?>">
            <?php echo format_date($Task->deadline, 'D'); ?>
        </span>
    </li>

    <!-- /.timeline-label -->
            <?php endif; ?>

    <!-- timeline item -->
    <li>
        <!-- timeline icon -->
        <i class="fa fa-envelope bg-blue"></i>
        <div class="timeline-item <?php echo $Task->getDeadlineCssClass(); ?>">
            <span class="time">
                <?php if($all): ?>
                    <a href="<?php echo url_for('@board_show?id=' . $Task->getBoard()->getId()); ?>"><?php echo $Task->getBoard(); ?></a>
                <?php endif; ?>
                                <span class="responsible"  title="Ответственный">
                    <i class="fa fa-user" style=""></i>
                                    <?php echo $Task->getResponsible()->getUsername(); ?>
                </span>
                <i class="fa fa-ban"></i> <?php echo $Task->punishment; ?>
            </span>

            <h3 class="timeline-header"><a href="#" class=""><?php echo $Task->name; ?></a></h3>

            <div class="timeline-body">
                <?php echo $Task->getRaw('description'); ?>
            </div>

            <div class='timeline-footer'>
                <span class="executer" title="Исполнитель">
                    <i class="fa fa-user" style=";"></i>
                    <?php echo $Task->getExecuter()->getUsername(); ?>
                </span>
                <?php if($sf_user->isExecuter($Task)): ?>
                <a class="btn btn-primary btn-xs" href="<?php echo url_for('@task_finished?id=' . $Task->id); ?>">Готово</a>
                <?php endif; ?>
                <?php if($sf_user->isCreator($Task) && !$Task->is_deadline_changed): ?>
                    <a class="btn btn-success btn-xs" href="<?php echo url_for('task/deadline?id=' . $Task->id); ?>">Изменить дедлайн</a>
                <?php endif; ?>
            </div>
        </div>
    </li>
    <!-- END timeline item -->

    <?php endforeach; ?>



</ul>
</div>

<script type="text/javascript">

    $(function () {


        var hfH = $('header').outerHeight() + $('footer').outerHeight();

        $('.timeline-wrapper').css('height', $(window).height() - hfH);


        $('.timeline-wrapper').scrollTop($('.timeline-wrapper')[0].scrollHeight);

    });

</script>