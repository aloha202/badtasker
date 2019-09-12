<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myModelGeneratorConfiguration
 *
 * @author Алекс
 */
abstract class myModelGeneratorConfiguration extends sfModelGeneratorConfiguration{
    
  protected function compile()
  {
    $config = $this->getConfig();
    

    // inheritance rules:
    // new|edit < form < default
    // list < default
    // filter < default
    $this->configuration = array(
      'list'   => array(
        'fields'         => array(),
        'layout'         => $this->getListLayout(),
        'title'          => $this->getListTitle(),
        'actions'        => $this->getListActions(),
        'object_actions' => $this->getListObjectActions(),
        'params'         => $this->getListParams(),
      ),
      'filter' => array(
        'fields'  => array(),
      ),
      'form'   => array(
        'fields'  => array(),
          'icons' => array()
      ),
      'new'    => array(
        'fields'  => array(),
        'title'   => $this->getNewTitle(),
        'actions' => $this->getNewActions() ? $this->getNewActions() : $this->getFormActions(),
      ),
      'edit'   => array(
        'fields'  => array(),
        'title'   => $this->getEditTitle(),
        'actions' => $this->getEditActions() ? $this->getEditActions() : $this->getFormActions(),
      ),
    );

    foreach (array_keys($config['default']) as $field)
    {
      $formConfig = array_merge($config['default'][$field], isset($config['form'][$field]) ? $config['form'][$field] : array());

      $this->configuration['list']['fields'][$field]   = new myModelGeneratorConfigurationField($field, array_merge(array('label' => sfInflector::humanize(sfInflector::underscore($field))), $config['default'][$field], isset($config['list'][$field]) ? $config['list'][$field] : array()));
      $this->configuration['filter']['fields'][$field] = new myModelGeneratorConfigurationField($field, array_merge($config['default'][$field], isset($config['filter'][$field]) ? $config['filter'][$field] : array()));
      $this->configuration['new']['fields'][$field]    = new myModelGeneratorConfigurationField($field, array_merge($formConfig, isset($config['new'][$field]) ? $config['new'][$field] : array()));
      $this->configuration['edit']['fields'][$field]   = new myModelGeneratorConfigurationField($field, array_merge($formConfig, isset($config['edit'][$field]) ? $config['edit'][$field] : array()));
    }

    // "virtual" fields for list
    foreach ($this->getListDisplay() as $field)
    {
      list($field, $flag) = myModelGeneratorConfigurationField::splitFieldWithFlag($field);

      $this->configuration['list']['fields'][$field] = new myModelGeneratorConfigurationField($field, array_merge(
        array('type' => 'Text', 'label' => sfInflector::humanize(sfInflector::underscore($field))),
        isset($config['default'][$field]) ? $config['default'][$field] : array(),
        isset($config['list'][$field]) ? $config['list'][$field] : array(),
        array('flag' => $flag)
      ));
    }

    // form actions
    foreach (array('edit', 'new') as $context)
    {
      foreach ($this->configuration[$context]['actions'] as $action => $parameters)
      {
        $this->configuration[$context]['actions'][$action] = $this->fixActionParameters($action, $parameters);
      }
    }

    // list actions
    foreach ($this->configuration['list']['actions'] as $action => $parameters)
    {
      $this->configuration['list']['actions'][$action] = $this->fixActionParameters($action, $parameters);
    }

    // list batch actions
    $this->configuration['list']['batch_actions'] = array();
    foreach ($this->getListBatchActions() as $action => $parameters)
    {
      $parameters = $this->fixActionParameters($action, $parameters);

      $action = 'batch'.ucfirst(0 === strpos($action, '_') ? substr($action, 1) : $action);

      $this->configuration['list']['batch_actions'][$action] = $parameters;
    }

    // list object actions
    foreach ($this->configuration['list']['object_actions'] as $action => $parameters)
    {
      $this->configuration['list']['object_actions'][$action] = $this->fixActionParameters($action, $parameters);
    }

    // list field configuration
    $this->configuration['list']['display'] = array();
    foreach ($this->getListDisplay() as $name)
    {
      list($name, $flag) = myModelGeneratorConfigurationField::splitFieldWithFlag($name);
      if (!isset($this->configuration['list']['fields'][$name]))
      {
        throw new InvalidArgumentException(sprintf('The field "%s" does not exist.', $name));
      }
      $field = $this->configuration['list']['fields'][$name];
      $field->setFlag($flag);
      $this->configuration['list']['display'][$name] = $field;
    }

    // parse the %%..%% variables, remove flags and add default fields where
    // necessary (fixes #7578)
    $this->parseVariables('list', 'params');
    $this->parseVariables('edit', 'title');
    $this->parseVariables('list', 'title');
    $this->parseVariables('new', 'title');

    // action credentials
    $this->configuration['credentials'] = array(
      'list'   => array(),
      'new'    => array(),
      'create' => array(),
      'edit'   => array(),
      'update' => array(),
      'delete' => array(),
    );
    foreach ($this->getActionsDefault() as $action => $params)
    {
      if (0 === strpos($action, '_'))
      {
        $action = substr($action, 1);
      }

      $this->configuration['credentials'][$action] = isset($params['credentials']) ? $params['credentials'] : array();
      $this->configuration['credentials']['batch'.ucfirst($action)] = isset($params['credentials']) ? $params['credentials'] : array();
    }
    $this->configuration['credentials']['create'] = $this->configuration['credentials']['new'];
    $this->configuration['credentials']['update'] = $this->configuration['credentials']['edit'];
  }
  
  protected function parseVariables($context, $key)
  {
    preg_match_all('/%%([^%]+)%%/', $this->configuration[$context][$key], $matches, PREG_PATTERN_ORDER);
    foreach ($matches[1] as $name)
    {
      list($name, $flag) = myModelGeneratorConfigurationField::splitFieldWithFlag($name);
      if (!isset($this->configuration[$context]['fields'][$name]))
      {
        $this->configuration[$context]['fields'][$name] = new myModelGeneratorConfigurationField($name, array_merge(
          array('type' => 'Text', 'label' => sfInflector::humanize(sfInflector::underscore($name))),
          isset($config['default'][$name]) ? $config['default'][$name] : array(),
          isset($config[$context][$name]) ? $config[$context][$name] : array(),
          array('flag' => $flag)
        ));
      }
      else
      {
        $this->configuration[$context]['fields'][$name]->setFlag($flag);
      }

      $this->configuration[$context][$key] = str_replace('%%'.$flag.$name.'%%', '%%'.$name.'%%', $this->configuration[$context][$key]);
    }
  }
  
  public function getFormFilterFields(sfForm $form)
  {
    $config = $this->getConfig();

    if ($this->getFilterDisplay())
    {
      $fields = array();
      foreach ($this->getFilterDisplay() as $name)
      {
        list($name, $flag) = myModelGeneratorConfigurationField::splitFieldWithFlag($name);
        if (!isset($this->configuration['filter']['fields'][$name]))
        {
          $this->configuration['filter']['fields'][$name] = new myModelGeneratorConfigurationField($name, array_merge(
            isset($config['default'][$name]) ? $config['default'][$name] : array(),
            isset($config['filter'][$name]) ? $config['filter'][$name] : array(),
            array('is_real' => false, 'type' => 'Text', 'flag' => $flag)
          ));
        }
        $field = $this->configuration['filter']['fields'][$name];
        $field->setFlag($flag);
        $fields[$name] = $field;
      }

      return $fields;
    }

    $fields = array();
    foreach ($form->getWidgetSchema()->getPositions() as $name)
    {
      $fields[$name] = new myModelGeneratorConfigurationField($name, array_merge(
        array('type' => 'Text'),
        isset($config['default'][$name]) ? $config['default'][$name] : array(),
        isset($config['filter'][$name]) ? $config['filter'][$name] : array(),
        array('is_real' => false)
      ));
    }

    return $fields;
  }
  
  public function getFormFields(sfForm $form, $context)
  {
    $config = $this->getConfig();

    $method = sprintf('get%sDisplay', ucfirst($context));
    if (!$fieldsets = $this->$method())
    {
      $fieldsets = $this->getFormDisplay();
    }
    

    if ($fieldsets)
    {
      $fields = array();

      // with fieldsets?
      if (!is_array(reset($fieldsets)))
      {
        $fieldsets = array('NONE' => $fieldsets);
      }

      foreach ($fieldsets as $fieldset => $names)
      {
        if (!$names)
        {
          continue;
        }
        
        //$icon = false;
        if(isset($names['display'])){
          //  $icon = !empty($names['icon']) ? $names['icon'] : false;
            $names = $names['display'];
        }

        $fields[$fieldset] = array();

        foreach ($names as $name)
        {
          list($name, $flag) = myModelGeneratorConfigurationField::splitFieldWithFlag($name);
          if (!isset($this->configuration[$context]['fields'][$name]))
          {
            $this->configuration[$context]['fields'][$name] = new myModelGeneratorConfigurationField($name, array_merge(
              isset($config['default'][$name]) ? $config['default'][$name] : array(),
              isset($config['form'][$name]) ? $config['form'][$name] : array(),
              isset($config[$context][$name]) ? $config[$context][$name] : array(),
              array('is_real' => false, 'type' => 'Text', 'flag' => $flag)
            ));
          }

          $field = $this->configuration[$context]['fields'][$name];
          $field->setFlag($flag);
          $fields[$fieldset][$name] = $field;
        }
      }

      return $fields;
    }

    $fields = array();
    foreach ($form->getWidgetSchema()->getPositions() as $name)
    {
      $fields[$name] = new myModelGeneratorConfigurationField($name, array_merge(
        array('type' => 'Text'),
        isset($config['default'][$name]) ? $config['default'][$name] : array(),
        isset($config['form'][$name]) ? $config['form'][$name] : array(),
        isset($config[$context][$name]) ? $config[$context][$name] : array(),
        array('is_real' => false)
      ));
    }

    return array('NONE' => $fields);
  }  
  
  
  public function getFieldsetIcon($fieldset_name) {
      $form_display = $this->getFormDisplay();
      
      return isset($form_display[$fieldset_name]['icon']) ? $form_display[$fieldset_name]['icon'] : false;
  }
  
    protected function fixActionParameters($action, $parameters) {
		$parameters = parent::fixActionParameters($action, $parameters);
		if($action == '_save_and_list'){
			$parameters['label'] = 'Save and back to list';
		}
		return $parameters;
	}
}
