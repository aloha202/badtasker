<div id="sf_admin_container">
    
    <div id="sf_admin_content">
<table>
  <tbody>
<?php foreach ($this->getColumns() as $column): ?>
    <tr>
      <th>[?php echo __('<?php echo sfInflector::humanize(sfInflector::underscore($column->getPhpName())) ?>'); ?]:</th>
      <td>[?php echo $<?php echo $this->getSingularName() ?>->get<?php echo sfInflector::camelize($column->getPhpName()) ?>() ?]</td>
    </tr>
<?php endforeach; ?>
  </tbody>
</table>

<hr />
<ul class='sf_admin_actions'>
    [?php echo $helper->linkToList(array('label' => 'Back to list')) ?]
</ul>
    </div>
</div>

<?php /*
<?php if (isset($this->params['route_prefix']) && $this->params['route_prefix']): ?>
<a href="[?php echo url_for('<?php echo $this->getUrlForAction('edit') ?>', $<?php echo $this->getSingularName() ?>) ?]">Edit</a>
&nbsp;
<a href="[?php echo url_for('<?php echo $this->getUrlForAction('list') ?>') ?]">List</a>
<?php else: ?>
<a href="[?php echo url_for('<?php echo $this->getModuleName() ?>/edit?<?php echo $this->getPrimaryKeyUrlParams() ?>) ?]">Edit</a>
&nbsp;
<a href="[?php echo url_for('<?php echo $this->getModuleName() ?>/index') ?]">List</a>
<?php endif; ?>
*/ ?>