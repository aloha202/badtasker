[?php echo page_header($page); ?]

<table class='table table-striped'>
  <tbody>
<?php foreach ($this->getColumns() as $column): ?>
    <tr>
      <th>[?php echo __('<?php echo sfInflector::humanize(sfInflector::underscore($column->getPhpName())) ?>'); ?]:</th>
      <td>[?php echo $<?php echo $this->getSingularName() ?>->get<?php echo sfInflector::camelize($column->getPhpName()) ?>() ?]</td>
    </tr>
<?php endforeach; ?>
  </tbody>
</table>

[?php if($<?php echo $this->getSingularName() ?>->isMy()): ?]
<div class='control-group'>
    [?php echo link_to(__('Edit'), url_for("<?php echo $this->getModuleName(); ?>_edit", $<?php echo $this->getSingularName(); ?>), array('class' => 'btn btn-primary btn-edit')) ?]
    [?php echo link_to(__('Delete'), url_for("<?php echo $this->getModuleName(); ?>_delete", $<?php echo $this->getSingularName(); ?>), array('class' => 'btn btn-primary btn-danger', 'post' => true)) ?]
</div>
[?php endif; ?]
