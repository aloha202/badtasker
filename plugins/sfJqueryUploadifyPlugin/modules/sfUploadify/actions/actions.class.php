<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of actions
 *
 * @author Алекс
 */
class sfUploadifyActions extends sfActions {
    
    public function executeUploadify(sfWebRequest $request)
    {   
        $file = $request->getFiles('Filedata');
        $model = $request->getParameter('model');
        $dir = sfConfig::get('sf_upload_dir') . '/' . sfInflector::underscore($model) . '/';
        $fileinfo = pathinfo($file['name']);
        
        $filename = session_id() . '_' . sha1(microtime()) . '.' . strtolower($fileinfo['extension']);
        move_uploaded_file($file['tmp_name'], $dir . $filename);

        $object = new $model;
        $object->setImage($filename);
        $object->save();
        

        sfConfig::set('sf_web_debug', false);
        return $this->renderText(json_encode(array(
            'filename' => $filename,
            'id' => $object->getId(),
            'filepath' => $object->getImageThumbnail('uploadify'),
            'model' => 'ProductImage',
            'remove_action' => 'product/removeImage'
        )));
    }
    
    public function executeGetObjects(sfWebRequest $request)
    {
        $ids = explode(',', $request->getParameter('ids', ''));
        $q = Doctrine::getTable($request->getParameter('model'))
                ->createQuery('m')
                ->whereIn('m.id', $ids)
                ;
        $objects = $q->execute();
        $json = array();
        foreach($objects as $object){
            $json[$object->getId()] = $object->toArray();
            $json[$object->getId()]['filepath'] = $object->getImageThumbnail('uploadify');
        }
        
        return $this->renderText(json_encode($json));
    }
    
    /*
    public function executeRemove(sfWebRequest $request)
    {
        $name = $request->getParameter('filename');
        $dir = sfConfig::get('sf_upload_dir') . '/uploadify/';
        
        @unlink($dir . $name);
        @unlink($dir . 'thumb_' . $name);
        
        sfConfig::set('sf_web_debug', false);
        return sfView::NONE;
    }
     * 
     */
    
}
