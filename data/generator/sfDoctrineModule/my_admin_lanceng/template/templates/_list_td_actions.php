<td>
  <div class="btn-group tbtns tbtns6 sf_admin_td_actions">
<?php foreach ($this->configuration->getValue('list.object_actions') as $name => $params): ?>
<?php if ('_delete' == $name): ?>
    <?php echo $this->addCredentialCondition('[?php echo $helper->linkToDelete2($'.$this->getSingularName().', '.$this->asPhp($params).') ?]', $params) ?>
                [?php slot('list.dialogs' . $<?php echo $this->getSingularName() ?>->id); ?]
		<div class="modal fade sf_admin_modal" id="delete-[?php echo $<?php echo $this->getSingularName(); ?>->id ?]" tabindex="-1" role="dialog"
			 aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span
								aria-hidden="true">&times;</span><span class="sr-only">[?php echo __('Close'); ?]</span></button>
						<h4 class="modal-title" id="myModalLabel">[?php echo __('Are you sure?') ?]</h4>
					</div>

					<div class="modal-body">
						[?php echo __('Remove %%object%%?', array('%%object%%' => $<?php echo $this->getSingularName(); ?>)); ?]
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">[?php echo __('Close') ?]</button>
                                                <?php echo $this->addCredentialCondition('[?php echo $helper->linkToDelete($'.$this->getSingularName().', '.$this->asPhp($params).') ?]', $params) ?>
					</div>

				</div>
			</div>
		</div>
                [?php end_slot(); ?]
<?php elseif ('_edit' == $name): ?>
    <?php echo $this->addCredentialCondition('[?php echo $helper->linkToEdit($'.$this->getSingularName().', '.$this->asPhp($params).') ?]', $params) ?>

<?php else: ?>
    
      <?php echo $this->addCredentialCondition($this->getLinkToAction($name, $params, true), $params) ?>

    
<?php endif; ?>
<?php endforeach; ?>
  </div>
</td>
