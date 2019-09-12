[?php use_helper( 'Date') ?]
[?php include_partial('<?php echo $this->getModuleName() ?>/assets') ?]


<div id="sf_admin_container">
  <div class="page-heading animated fadeInDownBig">
		<h1>[?php echo <?php echo $this->getI18NString('edit.title') ?> ?]</h1>
  </div>
    
    	<div class="row">
                
		<div class="col-sm-12">
                        
			<div class="box-info animated fadeInDown">
                                
				<h2>[?php echo <?php echo $this->getI18NString('edit.title') ?> ?]</h2>
                                
                                <div class='sf_admin_form_tabs'></div>                            
                                <div class="collapse in">
  [?php include_partial('<?php echo $this->getModuleName() ?>/flashes') ?]

  <div id="sf_admin_header">
    [?php include_partial('<?php echo $this->getModuleName() ?>/form_header', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form, 'configuration' => $configuration)) ?]
  </div>                                    
  <div id="sf_admin_content">
    [?php include_partial('<?php echo $this->getModuleName() ?>/form', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form, 'configuration' => $configuration, 'helper' => $helper)) ?]
  </div>

  <div id="sf_admin_footer">
    [?php include_partial('<?php echo $this->getModuleName() ?>/form_footer', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'form' => $form, 'configuration' => $configuration)) ?]
  </div>  
                                </div>
                        </div>
                </div>
        </div>




</div>
