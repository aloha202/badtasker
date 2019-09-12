<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfJqueryUploadifyHelper
 *
 * @author Алекс
 */
class sfJqueryUploadifyHelper {
    
    public static function get_temp_dir()
    {
        return sfConfig::get('sf_upload_dir') . '/' . sfConfig::get('app_sf_uploadify_temp_dir', 'uploadify') . '/';
    }
    
    public static function get_thumb_prefix()
    {
        return 'thumb_';
    }
    
}
