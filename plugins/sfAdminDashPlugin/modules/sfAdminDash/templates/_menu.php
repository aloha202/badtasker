<?php
  /** @var Array of menu items */ $items = $sf_data->getRaw('items');
  /** @var Array of categories, each containing an array of menu items and settings */ $categories = $sf_data->getRaw('categories');
?>


<?php if (count($items)): ?>
  <ul>
    <?php if (sfAdminDash::hasItemsMenu($items)): ?>
    <li class="node"><a href="#">Menu</a>
      <ul>
        <?php include_partial('sfAdminDash/menu_list', array('items' => $items, 'items_in_menu' => true)); ?>
      </ul>
    </li>
    <?php  endif; ?>
    <?php include_partial('sfAdminDash/menu_list', array('items' => $items, 'items_in_menu' => false)); ?>
  </ul>
<?php endif; ?>
<?php if (count($categories)): ?>
  <ul>
    <?php foreach ($categories as $name => $category): ?>
    <?php   if (sfAdminDash::hasPermission($category, $sf_user)): ?>
    <?php     if (sfAdminDash::hasItemsMenu($category['items'])): ?>
    <li class="node"><a href="<?php echo isset($category['url']) ? url_for($category['url']) : '#'; ?>"><?php echo __(isset($category['name']) ? $category['name'] : $name) ?></a>
        <sup class='new_messages new_messages_parent'></sup>
      <ul>
        <?php include_partial('sfAdminDash/menu_list', array('items' => $category['items'], 'items_in_menu' => true)) ?>
      </ul>
    </li>
    <?php     endif; ?>
    <?php   endif; ?>
    <?php endforeach; ?>
    <?php foreach ($categories as $name => $category): ?>
        <?php include_partial('sfAdminDash/menu_list', array('items' => $category['items'], 'items_in_menu' => false)) ?>
    <?php endforeach; ?>
  </ul>
<?php elseif (!count($items)): ?>
  <?php echo __('sfAdminDashPlugin is not configured.  Please see the %documentation_link%.', array('%documentation_link%'=>link_to(__('documentation', null, 'sf_admin_dash'), 'http://www.symfony-project.org/plugins/sfAdminDashPlugin?tab=plugin_readme', array('title' => __('documentation', null, 'sf_admin_dash')))), 'sf_admin_dash'); ?>
<?php endif; ?>

          <?php if($sf_context->isDeveloper()): ?>
<ul class='developer'>
    <li class='node'><a href='<?php echo url_for('settings_sys/index'); ?>' target='_blank'><?php echo __('Разработчик'); ?></a>
        <ul>
            <li class='item'><a href='<?php echo url_for('settings_sys/index'); ?>'><?php echo __('Системные настройки'); ?></a></li>
            <li class='item'><a href='<?php echo url_for('email_error/index'); ?>'><?php echo __('Ошибки электронной почты'); ?></a></li>            
            <li class='item'><a href='<?php echo url_for('menu_root/index'); ?>'><?php echo __('Меню'); ?></a></li>                        
            <li class='item'><a href='<?php echo url_for('text_block_sys/index'); ?>'><?php echo __('Текстовые блоки'); ?></a></li>                                    
            <li class='item'><a href='<?php echo url_for('todo_sys/index'); ?>'><?php echo __('ToDo'); ?></a></li>                                    			

            <li class='item'><a href='<?php echo url_for('dashboard/developerOff'); ?>' class='danger'><?php echo __('Выключить разработчика'); ?></a></li>
        </ul>        
    </li>
    <li class='node'><a href='<?php echo url_for('test/index'); ?>' target='_blank'><?php echo __('Тест'); ?></a>
        <ul>
            <li class='item'><a href='<?php echo url_for('test/sendmail'); ?>'><?php echo __('Отправка писем'); ?></a></li>
        </ul>
    </li>      
    <li class='node'><a href='<?php echo url_for('wiki/index'); ?>' target='_blank'><?php echo __('Вики'); ?></a>
        <ul>
            <?php include_component('wiki', 'menu'); ?>            
            <li class='item'><a href='<?php echo url_for('wiki/new'); ?>' class='green'><?php echo __('Добавить'); ?></a></li>            
        </ul>
    </li>    
</ul>
          <?php endif; ?>
          <?php if($sf_context->isEditor()): ?>
<ul class='developer editor'>
            <li class='node'><a href='<?php echo url_for('localization/index'); ?>'><?php echo __('Локализация'); ?></a></li>                                                
</ul>
<?php endif; ?>