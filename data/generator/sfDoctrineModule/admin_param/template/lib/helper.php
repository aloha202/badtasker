[?php

/**
 * <?php echo $this->getModuleName() ?> module configuration.
 *
 * @package    ##PROJECT_NAME##
 * @subpackage <?php echo $this->getModuleName()."\n" ?>
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: helper.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class Base<?php echo ucfirst($this->getModuleName()) ?>GeneratorHelper extends sfModelGeneratorHelper
{
  public function getUrlForAction($action)
  {
    return 'list' == $action ? '<?php echo $this->params['route_prefix'] ?>' . '?param=' . $this->getParam() : '<?php echo $this->params['route_prefix'] ?>_'.$action;
  }

  public function linkToDelete($object, $params)
  {
    if ($object->isNew())
    {
      return '';
    }
    return '<li class="sf_admin_action_delete">'.link_to(__($params['label'], array(), 'sf_admin'), url_for($this->getUrlForAction('delete'), array('sf_subject' => $object, 'param' => $this->getParam())), array('method' => 'delete', 'confirm' => !empty($params['confirm']) ? __($params['confirm'], array(), 'sf_admin') : $params['confirm'])).'</li>';
  }
  
  public function linkToEdit($object, $params)
  {
    return '<li class="sf_admin_action_edit">'.link_to(__($params['label'], array(), 'sf_admin'), url_for($this->getUrlForAction('edit'), array('param' => $this->getParam(), 'sf_subject' => $object))).'</li>';
  }

  public function linkToNew($params)
  {
    return '<li class="sf_admin_action_new">'.link_to(__($params['label'], array(), 'sf_admin'), '@'.$this->getUrlForAction('new') . '?param=' . $this->getParam()).'</li>';
  }  
  
  protected function getParam()
  {
    return sfContext::getInstance()->getRequest()->getParameter('param');
  }
}
