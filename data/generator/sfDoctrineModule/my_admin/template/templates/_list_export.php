[?php<?php foreach ($this->configuration->getValue('list.display') as $name => $field): ?>
 echo "" . __('<?php echo sfInflector::humanize($name); ?>') . "";
 echo $delimiter;
<?php endforeach; ?>
 echo "\n";
 foreach ($results as $i => $<?php echo $this->getSingularName() ?>): 
<?php foreach ($this->configuration->getValue('list.display') as $name => $field): ?>
 echo '"' . strip_tags(<?php echo $this->renderField($field); ?>) . '"';
 echo $delimiter;
<?php endforeach; ?>
 echo "\n";
endforeach;  ?]