<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<?php if ($sf_user->hasFlash('notice')): ?>
<div class="notice sysmessok light-green darken-4"><?php echo $sf_user->getFlash('notice') ?></div>
<?php endif; ?>

<?php if ($sf_user->hasFlash('error')): ?>
  <div class="error red darken-2"><?php echo $sf_user->getFlash('error') ?></div>
<?php endif; ?>
