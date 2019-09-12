<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
[?php if($<?php echo $this->getSingularName(); ?>->getAttach()): ?]
<a href='[?php echo url_for('<?php echo $this->getModuleName(); ?>/downloadAttachment?id=' . $<?php echo $this->getSingularName(); ?>->getId()); ?]' class='download'><i class='fa fa-download' title='[?php echo $<?php echo $this->getSingularName(); ?>->getAttachName(); ?]'></i></a>
[?php endif; ?]