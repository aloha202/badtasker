<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myModelGeneratorHelper
 *
 * @author aradyuk
 */
abstract class myModelGeneratorHelper extends sfModelGeneratorHelper {

    public function linkToEdit($object, $params) {
        return link_to('<i class="fa fa-pencil"></i>',  $this->getUrlForAction('edit'), $object, array('class' => 'btn btn-default', 'title' => __($params['label']), 'data-toggle' => 'tooltip'));
    }

    public function linkToDelete2($object, $params) {
        if ($object->isNew()) {
            return '';
        }
        
        return "<a title='Delete' class='btn btn-default' data-toggle='modal'
						data-target='#delete-{$object->id}'><i class='fa fa-trash-o'></i></a>";

        return link_to(__($params['label'], array(), 'sf_admin'), $this->getUrlForAction('delete'), $object, array('class' => 'btn btn-danger', 'method' => 'delete', 'confirm' => !empty($params['confirm']) ? __($params['confirm'], array(), 'sf_admin') : $params['confirm']));
    }
    
    public function linkToDelete($object, $params) {
        if ($object->isNew()) {
            return '';
        }
        
        return link_to(__($params['label'], array(), 'sf_admin'), $this->getUrlForAction('delete'), $object, array('class' => 'btn btn-danger', 'method' => 'delete'));
    }    

    public function linkToNew($params) {
        return link_to('<i class="fa fa-plus"></i> ' . __($params['label'], array(), 'sf_admin'), '@' . $this->getUrlForAction('new'), array('class' => 'btn btn-success'));
    }
    
  public function linkToList($params)
  {
    return link_to(__($params['label'], array(), 'sf_admin'), '@'.$this->getUrlForAction('list'), array('class' => 'btn btn-default'));
  }

  public function linkToSave($object, $params)
  {
    return '<input type="submit" class="btn btn-success" value="'.__($params['label'], array(), 'sf_admin').'" />';
  }

  public function linkToSaveAndAdd($object, $params)
  {
    if (!$object->isNew())
    {
      return '';
    }

    return '<input type="submit"  class="btn btn-success" value="'.__($params['label'], array(), 'sf_admin').'" name="_save_and_add" />';
  }    
  
  public function linkToSaveAndList($object, $params)
  {
    if(!$params['label']){
	//	$params['label'] = 'Save and back to list';
	}

    return '<input type="submit"  class="btn btn-success" value="'.__($params['label'], array(), 'sf_admin').'" name="_save_and_list" />';
  }    

}
