[?php

/**
 * <?php echo $this->modelName ?> form base class.
 * <?php echo get_class($this); ?> 
 * @method <?php echo $this->modelName ?> getObject() Returns the current form's model object
 *
 * @package    ##PROJECT_NAME##
 * @subpackage form
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
<?php $has_template_Attach = false; ?>
 <?php $has_template_Timestampable = false; ?>
 <?php $has_template_Meta = false; ?> 
 <?php $has_template_Redirect301 = false; ?>  
 <?php $has_template_Geo = false; ?>  
 
abstract class Base<?php echo $this->modelName ?>Form extends <?php echo $this->getFormClassToExtend().PHP_EOL ?>
{
  public function setup()
  {
    $this->setWidgets(array(
<?php foreach ($this->getColumns() as $column): ?>
      <?php $has_template_Timestampable = $column->getTable()->hasTemplate('Timestampable'); ?> 
    <?php $has_template_Meta = $column->getTable()->hasTemplate('Meta'); ?>
    <?php $has_template_Redirect301 = $column->getTable()->hasTemplate('Redirect301'); ?>    
    <?php $has_template_Geo = $column->getTable()->hasTemplate('Geo'); ?>        
      <?php if($column->getName() == 'image'  && $column->getTable()->hasTemplate('ImageBuilder')): //image builder column?>
        <?php 
		$ops = $column->getTable()->getOptions();
		$model_name = $ops['name'];
		$preset_name = sfInflector::underscore($model_name);        
        ?>
        'image' => $this->getObject()->getImage() ? new sfWidgetFormInputImageBuilder(array(
            'thumbs' => sfConfig::get('app_<?php echo $preset_name; ?>_thumbs'),
            'callback' => sfContext::getInstance()->getController()->genUrl(sfConfig::get('app_<?php echo $preset_name; ?>_callback') . '?model=<?php echo $model_name; ?>&id=' . $this->getObject()->getId()),
            'file_src' => $this->getObject()->getPhotoPath(),
            'template' => '<div rel="jcrop">%file%</div>'
        )) : new sfWidgetFormInputFile,        
      <?php elseif($column->getName() == 'attach'  && $column->getTable()->hasTemplate('Attach')): $has_template_Attach = true;?>        
        'attach' => new sfWidgetFormInputFileEditable(array(
            'file_src' => '/uploads/' . sfInflector::underscore(get_class($this->getObject())) .  '/' . $this->getObject()->getAttach(),
            'template' => $this->getObject()->getAttach() ? "%input%<a href='%file%' class='download'>{$this->getObject()->getAttachName()}</a><br />%delete%%delete_label%" : "%input%"
        )),
      <?php elseif($column->getName() == 'meta_keywords' && $has_template_Meta): ?>
        'meta_keywords' => new sfWidgetFormTextarea(array(), array('class' => 'mceNoEditor')), 
      <?php elseif($column->getName() == 'meta_description' && $has_template_Meta): ?>
        'meta_description' => new sfWidgetFormTextarea(array(), array('class' => 'mceNoEditor')),        
      <?php else: ?>
        '<?php echo $column->getFieldName() ?>'<?php echo str_repeat(' ', $this->getColumnNameMaxLength() - strlen($column->getFieldName())) ?> => new <?php echo $this->getWidgetClassForColumn($column) ?>(<?php echo $this->getWidgetOptionsForColumn($column) ?>),
      <?php endif; ?>

        
        
<?php endforeach; ?>
<?php foreach ($this->getManyToManyRelations() as $relation): ?>
      '<?php echo $this->underscore($relation['alias']) ?>_list'<?php echo str_repeat(' ', $this->getColumnNameMaxLength() - strlen($this->underscore($relation['alias']).'_list')) ?> => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => '<?php echo $relation['table']->getOption('name') ?>')),
<?php endforeach; ?>
    ));

    $this->setValidators(array(
<?php foreach ($this->getColumns() as $column): ?>
        <?php 
		$ops = $column->getTable()->getOptions();
		$model_name = $ops['name'];
		$preset_name = sfInflector::underscore($model_name);        
        ?>    
      <?php if($column->getName() == 'image' && $column->getTable()->hasTemplate('ImageBuilder')): ?>
        'image' => new sfValidatorFile(array(
         'path' => sfConfig::get('sf_web_dir') . '/uploads/<?php echo $preset_name; ?>',
         'required' => false,
         'mime_types' => 'web_images',
        )),
        'image_delete' => new sfValidatorPass,
      <?php elseif($column->getName() == 'attach'  && $column->getTable()->hasTemplate('Attach')): ?>        
        <?php 
		$ops = $column->getTable()->getOptions();
		$model_name = $ops['name'];
		$folder_name = sfInflector::underscore($model_name);        
                $options = $column->getTable()->getTemplate('Attach')->getOptions();
                $mime_types = $options['mime_types'] == '*' ? '"*"' : str_replace(array("\n", 'array ('), array('', 'array('), var_export($options['mime_types'], true));//$options['mime_types'] == '*' ? '"*"' : "array(" . join(',', $options['mime_types']) . ")"; 
        ?>           
        'attach' => new sfValidatorFile(array(
            'path' => sfConfig::get('sf_web_dir') . '/uploads/<?php echo $folder_name; ?>/',
            'mime_types' => <?php echo $mime_types; ?>,
            'required' => false
        )),     
        'attach_delete' => new sfValidatorPass,
      <?php else: ?>
        '<?php echo $column->getFieldName() ?>'<?php echo str_repeat(' ', $this->getColumnNameMaxLength() - strlen($column->getFieldName())) ?> => new <?php echo $this->getValidatorClassForColumn($column) ?>(<?php echo $this->getValidatorOptionsForColumn($column) ?>),
      <?php endif; ?>
<?php endforeach; ?>
<?php foreach ($this->getManyToManyRelations() as $relation): ?>
      '<?php echo $this->underscore($relation['alias']) ?>_list'<?php echo str_repeat(' ', $this->getColumnNameMaxLength() - strlen($this->underscore($relation['alias']).'_list')) ?> => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => '<?php echo $relation['table']->getOption('name') ?>', 'required' => false)),
<?php endforeach; ?>
    ));

<?php if ($uniqueColumns = $this->getUniqueColumnNames()): ?>
    $this->validatorSchema->setPostValidator(
<?php if (count($uniqueColumns) > 1): ?>
      new sfValidatorAnd(array(
<?php foreach ($uniqueColumns as $uniqueColumn): ?>
        new sfValidatorDoctrineUnique(array('model' => '<?php echo $this->table->getOption('name') ?>', 'column' => array('<?php echo implode("', '", $uniqueColumn) ?>'))),
<?php endforeach; ?>
      ))
<?php else: ?>
      new sfValidatorDoctrineUnique(array('model' => '<?php echo $this->table->getOption('name') ?>', 'column' => array('<?php echo implode("', '", $uniqueColumns[0]) ?>')))
<?php endif; ?>
    );

<?php endif; ?>
    $this->widgetSchema->setNameFormat('<?php echo $this->underscore($this->modelName) ?>[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    <?php if($has_template_Attach): ?>
       unset($this['attach_name'], $this['attach_mime']);
    <?php endif; ?>
       
    <?php if($has_template_Timestampable): ?>
     unset($this['created_at'], $this['updated_at']);
    <?php endif; ?>       
     
     <?php if($has_template_Geo): ?>
     unset($this['geo_lat'], $this['geo_lng'], $this['geo_country'], $this['geo_city'], $this['geo_address'], $this['geo_address_formatted']);
        $this->widgetSchema['gmaps'] = new myWidgetFormGmaps(array(
        ));
        $this->validatorSchema['gmaps'] = new myValidatorGeo(array('required' => false));
     <?php endif; ?>
    
  }

  public function getModelName()
  {
    return '<?php echo $this->modelName ?>';
  }
    public function updateObject($values = null)
    {
        $object = parent::updateObject($values);
        <?php if($has_template_Geo): ?>
        if(!empty($this->values['gmaps'])){
          $object->setGeoLat($this->values['gmaps']['lat']);
          $object->setGeoLng($this->values['gmaps']['lng']);      
          $object->setGeoCity($this->values['gmaps']['city']);            
          $object->setGeoCountry($this->values['gmaps']['country']);                  
          $object->setGeoAddress($this->values['gmaps']['address']);                        
          $object->setGeoAddressFormatted($this->values['gmaps']['address_formatted']);                        
        }        
        <?php endif; ?>
        return $object;
    }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();
    foreach($this->embeddedTextBlocks as $block_name){
        $TextBlock = Q::c('TextBlock', 'b')
            ->where('b.special_mark = ?', $block_name)
            ->fetchOne();
        if($TextBlock){
            $this->setDefault($block_name, $TextBlock->text);
        }
    }    
    <?php if($has_template_Geo): ?>
      if($this->getObject()->hasGeo()){
          $this->setDefault('gmaps', array(
              'lat' => $this->getObject()->getGeoLat(), 
              'lng' => $this->getObject()->getGeoLng(),
              'city' => $this->getObject()->getGeoCity(),
              'country' => $this->getObject()->getGeoCountry(),              
              'address' => $this->getObject()->getGeoAddress(),                            
              'address_formatted' => $this->getObject()->getGeoAddressFormatted(),                                          
          ));
      }    
    <?php endif; ?>
<?php if ($this->getManyToManyRelations()): ?>
<?php foreach ($this->getManyToManyRelations() as $relation): ?>
    if (isset($this->widgetSchema['<?php echo $this->underscore($relation['alias']) ?>_list']))
    {
      $this->setDefault('<?php echo $this->underscore($relation['alias']) ?>_list', $this->object-><?php echo $relation['alias']; ?>->getPrimaryKeys());
    }

<?php endforeach; ?>
<?php endif; ?>
  }
<?php if ($this->getManyToManyRelations()): ?>  
<?php foreach ($this->getManyToManyRelations() as $relation): ?>
  public function save<?php echo $relation['alias'] ?>List($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['<?php echo $this->underscore($relation['alias']) ?>_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object-><?php echo $relation['alias']; ?>->getPrimaryKeys();
    $values = $this->getValue('<?php echo $this->underscore($relation['alias']) ?>_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('<?php echo $relation['alias'] ?>', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('<?php echo $relation['alias'] ?>', array_values($link));
    }
  }

<?php endforeach; ?>  
<?php endif; ?>
  

  protected function doSave($con = null)
  {
<?php if ($this->getManyToManyRelations() || $has_template_Attach): ?>    
<?php if($this->getManyToManyRelations()): foreach ($this->getManyToManyRelations() as $relation): ?>
    $this->save<?php echo $relation['alias'] ?>List($con);
<?php endforeach; endif;?>
    <?php if($has_template_Attach): ?>
    if (!empty($this->values['attach'])) {
        if ($this->values['attach'] instanceof sfValidatedFile) {
            $this->getObject()->setAttachName($this->values['attach']->getOriginalName());
            $this->getObject()->setAttachMime($this->values['attach']->getType());
        }
    }    
    <?php endif; ?>
    
    
<?php endif; ?>
    parent::doSave($con);
    
    foreach($this->embeddedTextBlocks as $block_name){
        $TextBlock = Q::c('TextBlock', 'b')
            ->where('b.special_mark = ?', $block_name)
            ->fetchOne();
        if($TextBlock){
            $TextBlock->text = $this->values[$block_name];
            $TextBlock->save();
        }
    }
  }



}
