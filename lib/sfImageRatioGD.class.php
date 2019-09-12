<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfImageRatioGD
 *
 * @author Алекс
 */
class sfImageRatioGD extends sfImageTransformAbstract{
    
    protected $ratio;
    
    public function __construct($ratio) {
        $this->ratio = $ratio;
    }
    
    public function transform(sfImage $image)
    {
        $w = $image->getWidth();
        $h = $image->getHeight();
        $height = $w / $this->ratio;
        if($height > $h){
            $height = $h;
            $width = $w*$this->ratio;
            $top = 0;
            $left = ($w - $width) / 2;
        }else{
            $width = $w;
            $left = 0;
            $top = ($h - $height) / 2;
        }
        
        return $image->crop($left, $top, $width, $height);
        
        //return $image;
    }
    
}
