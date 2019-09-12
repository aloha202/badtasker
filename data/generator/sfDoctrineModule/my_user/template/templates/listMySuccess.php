[?php echo page_header($page); ?]


[?php include_partial('<?php echo $this->getModuleName(); ?>/list', array('pager'=>$pager)) ?]

[?php include_partial('<?php echo $this->getModuleName(); ?>/pager', array('pager'=>$pager)) ?]

<a href="[?php echo url_for('<?php echo $this->getModuleName() ?>/new') ?]" class='btn'>[?php echo __('New') ?]</a>
