<?php $table = Doctrine::getTable($this->getModelClass()); ?>
<?php $hide_fields = array(
    'meta_title', 'meta_description', 'meta_keywords',
    'slug', 'updated_at', 'geo_lat', 'geo_lng', 'geo_address_formatted', 'id'
); 
    $field_real_names = array(
      'geo_country' => 'Country',
        'geo_city' => 'City',
        'geo_address' => 'Address'
    );
?>
<table class='table table-striped'>
  <thead>
    <tr>
<?php foreach ($this->getColumns() as $column): ?>
        <?php if(!in_array($column->getPhpName(), $hide_fields)): ?>
        <?php $name = isset($field_real_names[$column->getPhpName()]) ? $field_real_names[$column->getPhpName()] : sfInflector::humanize(sfInflector::underscore($column->getPhpName())) ; ?>
      <th class='<?php echo $column->getPhpName(); ?>'>[?php echo __('<?php echo $name?>') ?]</th>
      <?php endif; ?>
<?php endforeach; ?>
      <td>&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    [?php foreach ($pager->getResults() as $<?php echo $this->getSingularName() ?>): ?]
    <tr>
<?php foreach ($this->getColumns() as $column): ?>
                <?php if(!in_array($column->getPhpName(), $hide_fields)): ?>
      <?php if($column->getPhpName() == 'image' && $table->hasTemplate('ImageBuilder')): ?>
        <td><img src="[?php echo $<?php echo $this->getSingularName() ?>->getImageThumbnail() ?]" alt="" /></td>      
      <?php else: ?>
        <td>[?php echo $<?php echo $this->getSingularName() ?>->get<?php echo sfInflector::camelize($column->getPhpName()) ?>() ?]</td>
      <?php endif; ?>
        <?php endif; ?>
<?php endforeach; ?>
        <td>
<a href="[?php echo url_for('<?php echo $this->getModuleName() ?>_show', $<?php echo $this->getSingularName() ?>) ?]">[?php echo __('View') ?]</a>            
        </td>
    </tr>
    [?php endforeach; ?]
  </tbody>
</table>