<?php

/**
 * @author Viacheslav Zhuravski
 * @copyright 2008
 */

class Image 
{
	
	public    $rImage = null;
	protected $iWidth = 0;
	protected $iHeight = 0;
	
	protected $sFilename = null;
	
	function __clone()
    {	
		if ( $this->rImage !== null ){
			
			$rImage = imagecreatetruecolor( $this->iWidth, $this->iHeight );
			imagecopy( $rImage, $this->rImage, 0, 0, 0, 0, $this->iWidth, $this->iHeight );			
			$this->rImage = $rImage;
		}
	}
		
	function Create( $iWidth, $iHeight ){
		
		$iWidth = intval( $iWidth );
		$iHeight = intval( $iHeight );
		
		if ( $iWidth <= 0 || $iHeight <= 0 ){
			return false;
		}
		
		$this->rImage = imagecreatetruecolor( $iWidth, $iHeight );
		
		$this->iWidth = $iWidth;
		$this->iHeight = $iHeight;
		
		return true;
	}
	
	function Open( $sFilename ){
		
		$rImage = false;		
		
		if ( $rImage = @imagecreatefromjpeg( $sFilename ) ){			
		}
		elseif ( $rImage = @imagecreatefrompng( $sFilename ) ){			
		}
		elseif ( $rImage = @imagecreatefromgif( $sFilename ) ){			
		}
		elseif ( $rImage = @imagecreatefromwbmp( $sFilename ) ){			
		}
		
		if ( !$rImage ){
			return false;
		}		
		
		$this->Destroy();		
		$this->rImage = $rImage;
		
		$this->iWidth = imagesx( $this->rImage );
		$this->iHeight = imagesy( $this->rImage );
				
		$this->sFilename = $sFilename;
		
		return true;
	}
	
	function GetSize()
    {
        return array(
                        'width' => $this->iWidth,
                        'height' => $this->iHeight,
                    );
    }
	
	function Save( $sFormat = 'JPG', $iJpegQuality = 100 )
	{	
		$this->SaveAs( $this->sFilename, $sFormat, $iJpegQuality );
	}
	
	
	
	function SaveAs( $sFilename, $sFormat = 'JPEG', $iJpegQuality = 100 ){
		
		if ( $this->rImage === null || $sFilename === null )
		{			
			return false;
		}
		
		switch ( strtoupper($sFormat) ){
			
			case 'JPEG': case 'JPG':				
				$iJpegQuality = max( 0, min( 100, intval( $iJpegQuality ) ) );				
				return (bool)( imagejpeg( $this->rImage, $sFilename, $iJpegQuality ) );
				break;
				
			case 'GIF':				
				return (bool)( @imagegif( $this->rImage, $sFilename ) );
				break;
				
			case 'PNG':				
				return (bool)( @imagepng( $this->rImage, $sFilename ) );
				break;
				
			case 'WBMP':				
				return (bool)( @imagewbmp( $this->rImage, $sFilename ) );
				break;						
			
			default:									
				return false;
				break;
		}
		
	}
	
	
	function Crop( $iX1, $iY1, $iX2, $iY2 ){
		
		$iX1 = intval( min( $iX1, $iX2 ) );
		$iY1 = intval( min( $iY1, $iY2 ) );		
		
		$iWidth = abs($iX2 - $iX1);
		$iHeight = abs($iY2 - $iY1);
		
		$rImage = imagecreatetruecolor( $iWidth, $iHeight );
		
		imagecopyresampled( $rImage, $this->rImage, 0, 0, $iX1, $iY1, $iWidth, $iHeight, $iWidth, $iHeight );

        $this->Destroy();
                        
        $this->rImage = $rImage;
		$this->iWidth = $iWidth;
		$this->iHeight = $iHeight;
		
		 
		
		return true; 
				
	}
	
	
	function Resize( $iWidth, $iHeight ) 
    {
		$iWidth = intval( $iWidth );
		$iHeight = intval( $iHeight );
		
		if ( $iWidth <= 0 || $iHeight <= 0 || $this->rImage === null ){
			return false;
		}			
				
        $rImage = imagecreatetruecolor( $iWidth, $iHeight );

        imagecopyresampled( $rImage, $this->rImage, 0, 0, 0, 0, $iWidth, $iHeight, $this->iWidth, $this->iHeight );

        $this->Destroy();
        
		$this->rImage = $rImage;
		$this->iWidth = $iWidth;
		$this->iHeight = $iHeight;
		
		return true;        
	}
	
	function ResizeCrop( $iWidth, $iHeight, $iStartX = -1, $iStartY = -1, $iScale = 1 ) 
    {
	    $iWidth = intval( $iWidth );
		$iHeight = intval( $iHeight );
		
		if ( $iWidth <= 0 || $iHeight <= 0 || $this->rImage === null )
        {
			return false;
		}			
				
        $rImage = imagecreatetruecolor( $iWidth, $iHeight );
        
        $x = $this->iWidth;
        $y = $this->iHeight;

        $dstX = 0;
        $dstY = 0;
                                  
        $dstW = $iWidth * $iScale;
        $dstH = $iHeight * $iScale;

        if ( $x / $y >= $dstW / $dstH ) 
        {
            $srcY = $iStartY;
            if($srcY < 0){
                $srcY = 0;
            }
            $srcH = $y;
            $srcW = $srcH * $dstW / $dstH;
            $srcX = ($iStartX != -1) ? $iStartX : ( $x - $srcW ) / 2;
        }
        else 
        {
            $srcX = $iStartX;
            if($srcX < 0){
                $srcX = 0;
            }
            $srcW = $x;
            $srcH = $srcW * $dstH / $dstW;
            $srcY = ($iStartY != -1) ? $iStartY :( $y - $srcH ) / 2;
        }
                      
        imagecopyresampled( $rImage, $this->rImage, $dstX, $dstY, $srcX, $srcY, $dstW, $dstH, $srcW, $srcH );

        $this->Destroy();
        
		$this->rImage = $rImage;
		$this->iWidth = $iWidth;
		$this->iHeight = $iHeight;
		
		return true;
    }


    function ResizeProportionallyToFit( $iWidth, $iHeight ) {

        $iWidth = intval( $iWidth );
		$iHeight = intval( $iHeight );
		
		if ( $iWidth <= 0 || $iHeight <= 0 || $this->rImage === null ){
			return false;
		}			
				        
        
        $x = $this->iWidth;
        $y = $this->iHeight;

        $dstW = $iWidth;
        $dstH = $iHeight;

        if ( $x / $y <= $dstW / $dstH ) {
            $srcH = $y;
            $srcW = $srcH * $x / $y;
            $dstW = $dstH * $x / $y;
        }
        else {
            $srcW = $x;
            $srcH = $srcW * $y / $x;
            $dstH = $dstW * $y / $x;
        }

        $rImage = imagecreatetruecolor( $dstW, $dstH );

        imagecopyresampled( $rImage, $this->rImage, 0, 0, 0, 0, $dstW, $dstH, $srcW, $srcH );

        $this->Destroy();
        
		$this->rImage = $rImage;
		$this->iWidth = $dstW;
		$this->iHeight = $dstH;
		
		return true;
    }
	
	function ResizeProportionalyIfBig( $iWidth, $iHeight )
    {
        $iWidth = intval( $iWidth );
        $iHeight = intval( $iHeight );
        
        if ( $iWidth <= 0 || $iHeight <= 0 || $this->rImage === null ){
            return false;
        }
        
        if( ($this->iWidth < $iWidth) || ($this->iHeight < $iHeight ) )
        {
            return false;
        }
        
        return $this->ResizeProportionallyToFit( $iWidth, $iHeight );
    }
    
    function Rotate( $iDeg )
    {
        $this->rImage = imagerotate( $this->rImage, $iDeg, 0 );
    }
    
	function Destroy(){
		
		if ( $this->rImage !== null ){
			imagedestroy( $this->rImage );
		}
		
		$this->rImage = null;
		$this->iWidth = 0;
		$this->iHeight = 0;	
		$this->sFilename = null;
	}
	
    function mergeWith( $sImgPath, $iX, $iY )
    {
        $oImg = new Image();
        $oImg->open( $sImgPath );
        $aSize = $oImg->GetSize();
                  
        return imagecopy( $this->rImage, $oImg->getResource(), $iX, $iY, 0, 0, $aSize['width'], $aSize['height'] );
    }
    
    function getResource()
    {
        return $this->rImage;
    }
    
	function __destructor()
    {	
		$this->Destroy();		
	}
}

/**
 * @author Samusevich Alexander
 * @copyright 2010
 */

class ImageCropDecorator
{
    static private $oImageInstance = null;
    
    static private $aImageProperties = array();
    static private $sSourceDir = '';
    static private $sDestDir   = '';
    
    static public function setSourceDir( $sPath )
    {
        self::$sSourceDir = $sPath;
    }
    
    static public function setDestDir( $sPath )
    {
        self::$sDestDir = $sPath;
    }
    
    /**
     * Set image properties
     * Avaible properties: array( 'name', 'width', 'height', 'pfx', 'ext', 'method', 'copyright' )
     *      name: image destination name (is required)
     *      width: image width
     *      height: image height
     *      pfx: name postfix for destination name ( ex. myPhoto.jpg.small, '.small' is a pfx )
     *      ext: image destination extension: jpg, png etc.
     *      method: enum {'none', 'scale', 'crop'}
     *      copyright: array( 'path', 'x', 'y' )
     * @param array $aProperty
     * @param integer $iNum
     */
    static public function addImageProperty( array $aProperty, integer $iNum = null )
    {
        if( $iNum !== null )
        {
            self::$aImageProperties[$iNum] = $aProperty;
        }
        else
        {
            self::$aImageProperties[] = $aProperty;
        }
    }
    
    /**
     * Clear all properties
     */
    static public function clearProperties()
    {
        self::$aImageProperties = array();
    }
    
    /**
     * Create image with current properties
     * @param string $sSourceImageName
     * @param string $bDeleteSourceImage
     */
    static public function create( $sSourceImageName, $bDeleteSourceImage = false )
    {
        if( !class_exists( 'Image' ) ) 
            throw new Exception( 'Class "Image" not found!' );
        
        self::$oImageInstance = (self::$oImageInstance) ? self::$oImageInstance : new Image(); 
                                                              
        if( !file_exists( self::$sSourceDir . $sSourceImageName ) ) 
            throw new Exception( 'Source image not found! Image path:' . self::$sSourceDir . $sSourceImageName );
        
        self::$sDestDir = ( self::$sDestDir ) ? self::$sDestDir : self::$sSourceDir;
        
        foreach( self::$aImageProperties as $aProperty )
        {
            self::$oImageInstance->Open( self::$sSourceDir . $sSourceImageName );
            
            if( isset( $aProperty['copyright'] ) )
            {
                $oCopyImg = new Image();
                if( !$oCopyImg->open( $aProperty['copyright']['path'] ) )
                {
                    throw new Exception( 'Image for copyright not found! Image path:' . $aProperty['copyright']['path'] );
                }
                
                $iX = intval( $aProperty['copyright']['x'] ); 
                $iY = intval( $aProperty['copyright']['y'] );
                
                $aDestSize = self::$oImageInstance->getSize();
                $aCopySize = $oCopyImg->getSIze();
                
                if( $aProperty['copyright']['x'] == 'left' ) $iX = 0;
                if( $aProperty['copyright']['x'] == 'right' ) $iX = $aDestSize['width'] - $aCopySize['width'];
                if( $aProperty['copyright']['y'] == 'top' ) $iY = 0;
                if( $aProperty['copyright']['y'] == 'bottom' ) $iY = $aDestSize['height'] - $aCopySize['height'];
                
                $oCopyImg->destroy();
                
                self::$oImageInstance->mergeWith( $aProperty['copyright']['path'], $iX, $iY );
            }
            
            $aProperty['method'] = (isset($aProperty['method']) && $aProperty['method']) ? $aProperty['method'] : null;
            
            switch( $aProperty['method'] )
            {
                case 'none': break;
            	case 'crop':
                    self::$oImageInstance->ResizeCrop( $aProperty['width'], $aProperty['height'], $aProperty['x'], $aProperty['y'], $aProperty['scale'] );
                    break;
                case 'scale': default: 
            		self::$oImageInstance->ResizeProportionallyToFit( $aProperty['width'], $aProperty['height'] );
            		break;
            }
                      
            $aProperty['pfx'] = (isset($aProperty['pfx'])) ? $aProperty['pfx'] : '';          
                      
            self::$oImageInstance->SaveAs( self::$sDestDir . $aProperty['name'] . $aProperty['pfx'], $aProperty['ext'] );

            self::$oImageInstance->Destroy();
        }   
        
        if( $bDeleteSourceImage ) @unlink( self::$sSourceDir . $sSourceImageName );
        
        self::$aImageProperties = array();
        
        return true;        
    }
    
    public static function waterMark($original, $watermark, $placement = 'bottom=5,right=5', $destination = null) {
        //$original = urldecode($original);
        $dump = array();
        $dump[] = $original;
        $dump[] = file_exists($original);

        $original_src = $original;
        $info_o = @getImageSize($original);
        
        
        if (!$info_o)
            return false;
        $info_w = @getImageSize($watermark);
        if (!$info_w)
            return false;

        list ($vertical, $horizontal) = split(',', $placement, 2);
        list($vertical, $sy) = split('=', trim($vertical), 2);
        list($horizontal, $sx) = split('=', trim($horizontal), 2);

        
        switch (trim($vertical)) {
            case 'bottom':
                $y = $info_o[1] - $info_w[1] - (int) $sy;
                break;
            case 'middle':
                $y = ceil($info_o[1] / 2) - ceil($info_w[1] / 2) + (int) $sy;
                break;
            default:
                $y = (int) $sy;
                break;
        }
        

        switch (trim($horizontal)) {
            case 'right':
                $x = $info_o[0] - $info_w[0] - (int) $sx;
                break;
            case 'center':
                $x = ceil($info_o[0] / 2) - ceil($info_w[0] / 2) + (int) $sx;
                break;
            default:
                $x = (int) $sx;
                break;
        }
      //  header("Content-Type: " . $info_o['mime']);

        $original = @imageCreateFromString(file_get_contents($original));
        $watermark = @imageCreateFromString(file_get_contents($watermark));
        $out = imageCreateTrueColor($info_o[0], $info_o[1]);

        imageCopy($out, $original, 0, 0, 0, 0, $info_o[0], $info_o[1]);
        $dump[] = 'hello2';
        file_put_contents(sfConfig::get('sf_web_dir') . '/text.txt', join("\n", $dump));   


//Тут задаем размер изображения в которые можно добавлять Watermark
// $info_o[0] > 250 - ширина изображения должна быть больше 250 px
// $info_o[1] > 250 - высота изображения должна быть больше 250 px

        if (($info_o[0] > 250) && ($info_o[1] > 250)) {
            imageCopy($out, $watermark, $x, $y, 0, 0, $info_w[0], $info_w[1]);
        }

        switch ($info_o[2]) {
            case 1:
                imageGIF($out, $original_src);
                break;
            case 2:
                imagejpeg($out, $original_src);
                break;
            case 3:
                imagePNG($out, $original_src);
                break;
        }

        imageDestroy($out);
        imageDestroy($original);
        imageDestroy($watermark);

        return true;
    }    
}

?>