<ul>
    <?php foreach($Boards as $board): ?>
        <li <?php if($sf_context->isCurrentBoard($board)): ?>class="active"<?php endif; ?>><a href="<?php echo url_for('@board_show?id=' . $board->id); ?>"><?php echo $board->name; ?></a></li>
    <?php endforeach; ?>
</ul>