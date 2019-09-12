[?php use_helper('Date') ?]
[?php include_partial('<?php echo $this->getModuleName() ?>/assets') ?]

<div id="sf_admin_container">
    <div class="page-heading animated fadeInDownBig">

  <h1>[?php echo <?php echo $this->getI18NString('list.title') ?> ?]</h1>
    </div>

  

  <div id="sf_admin_header">
    [?php include_partial('<?php echo $this->getModuleName() ?>/list_header', array('pager' => $pager)) ?]
  </div>


   
    <div <?php if ($this->configuration->hasFilterForm()): ?>class='col-md-9'<?php endif; ?>>
  <div class="box-info full">
      <h2><strong>[?php echo <?php echo $this->getI18NString('list.title') ?> ?]</strong></h2>
      [?php include_partial('<?php echo $this->getModuleName() ?>/flashes') ?]

  <div id="sf_admin_content">
<?php if ($this->configuration->getValue('list.batch_actions')): ?>
    <form action="[?php echo url_for('<?php echo $this->getUrlForAction('collection') ?>', array('action' => 'batch')) ?]" method="post">
<?php endif; ?>
    [?php include_partial('<?php echo $this->getModuleName() ?>/list', array('pager' => $pager, 'sort' => $sort, 'helper' => $helper)) ?]
    <div class="sf_admin_actions">
      [?php include_partial('<?php echo $this->getModuleName() ?>/list_batch_actions', array('helper' => $helper)) ?]
      [?php include_partial('<?php echo $this->getModuleName() ?>/list_actions', array('helper' => $helper)) ?]
    </div>
<?php if ($this->configuration->getValue('list.batch_actions')): ?>
    </form>
<?php endif; ?>
  </div>
  </div>
    </div>
    
    
<?php if ($this->configuration->hasFilterForm()): ?>
    <div class='col-md-3'>
  <div id="sf_admin_bar" class='box-info full'>
    [?php include_partial('<?php echo $this->getModuleName() ?>/filters', array('form' => $filters, 'configuration' => $configuration)) ?]
  </div>
        </div>
<?php endif; ?>        
    

  <div id="sf_admin_footer">
    [?php include_partial('<?php echo $this->getModuleName() ?>/list_footer', array('pager' => $pager)) ?]
  </div>
</div>
<div class='clearfix'></div>
