<?php $url = "//" . $_SERVER['HTTP_HOST'] . '/cms.php'; ?>
<div class="TheApp_message"><?php echo __('You are not authorized. Please follow this %link% to get authorized', [
    '%link%' => '<a href="' . $url . '" target="_blank">' . __('Link') . '</a>'
    ]); ?></div>