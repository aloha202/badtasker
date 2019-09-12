<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ImageBuilderListener
 *
 * @author Алекс
 */
class ImageBuilderListener extends Doctrine_Record_Listener{
    
    protected $_options = array();
    protected $_image = '';

    public function __construct(array $options)
    {
        $this->_options = $options;
    }    
    
    
    public function postSave(Doctrine_Event $event)
    {
        $object = $event->getInvoker();
        $uplDir = sfConfig::get('sf_upload_dir') . '/' . sfInflector::underscore(get_class($object)) . '/';        
        if( $object->getImage() )
        {
            // Read all photo preview          
            $aThumbs = sfConfig::get('app_' . sfInflector::underscore(get_class($object)) . '_thumbs');
            
            foreach( $aThumbs as $sThumbName => $aProperties )
            {
                // Check thumb extension
                if( !isset($aProperties['ext']) || !$aProperties['ext'])
                {
                    $aProperties['ext'] = '.' . $sThumbName;
                }
                
                // Disable thumb rewriting
                if( !file_exists( $uplDir . $object->getImage() . $aProperties['ext'] ) )
                {
                    self::createThumb($object, $sThumbName );    
                }
            }
        }else{
            $object = $event->getInvoker();
            $aThumbs = sfConfig::get('app_' . sfInflector::underscore(get_class($object)) . '_thumbs'); 
        }

    }


    public static function createThumb( $object, $sThumbName, $iStartX = -1, $iStartY = -1, $iScale = 1 )
    {

        ImageCropDecorator::clearProperties();
        
        $folder = sfInflector::underscore(get_class($object));
        $preset = sfInflector::underscore(get_class($object));
        // Set upload path
        $uplDir = sfConfig::get('sf_upload_dir') . '/' . $folder . '/';
        
        ImageCropDecorator::setSourceDir( $uplDir );
        ImageCropDecorator::setDestDir( $uplDir );
        
        // Read preview extension (e.g. .small)
        $sExt = sfConfig::get("app_{$preset}_image_ext");
                
        // Read configuration
        $aThumbs = sfConfig::get("app_{$preset}_thumbs");
        $aConfiguration = $aThumbs[$sThumbName];
        
        // Configure thumb
        ImageCropDecorator::addImageProperty
        (
            array(  'name'      => $object->getImage(),
                    'ext'       => $sExt,
                    'width'     => (isset($aConfiguration['width']))  ? $aConfiguration['width']  : '9999',
                    'height'    => (isset($aConfiguration['height'])) ? $aConfiguration['height'] : '9999',
                    'method'    => (isset($aConfiguration['method'])) ? $aConfiguration['method'] : '',
                    'pfx'       => (isset($aConfiguration['ext']) && $aConfiguration['ext']) ? $aConfiguration['ext'] : '.' . $sThumbName,
                    'x'         => $iStartX,
                    'y'         => $iStartY,
                    'scale'     => $iScale,
            )
        );   
                               
        // Create thumb
        ImageCropDecorator::create( $object->getImage() );   
    }    

    
}
