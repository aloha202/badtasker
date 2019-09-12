<?php

/**
 * sfWidgetFormInputFilePhEditable extend sfWidgetFormInputFileEditable class for include crop UI
 *
 * @package    PhBackend
 * @subpackage widget
 * @author     Samusevich Alexander <archer@fishartis.com>
 * @version    1.0 2011-11-14 14:27 archer
 */
class sfWidgetFormInputImageBuilder extends sfWidgetFormInputFileEditable
{
   /**
   * Constructor.
   *
   * Available options:
   *
   *  * file_src:     The current image web source path (required)
   *  * edit_mode:    A Boolean: true to enabled edit mode, false otherwise
   *  * with_delete:  Whether to add a delete checkbox or not
   *  * delete_label: The delete label used by the template
   *  * thumbs:       Array of thumb parameters (required)
   *                    * width - thumb width
   *                    * height - thumb height
   *                    * method - creation method (procesing crop only)
   *                    * ext - thumb file extension
   *   
   *   * model:       Model class name (for callback)
   *   * callback:    Url for ajax crop handler. 
   *                  Avaible parameters:
   *                    * name - thumb name
   *                    * x - x offset
   *                    * y - y offset
   *                    * model - model class name
   * 
   * In edit mode, this widget renders an additional widget named after the
   * file upload widget with a "_delete" suffix. So, when creating a form,
   * don't forget to add a validator for this additional field.
   *
   * @param array $options     An array of options
   * @param array $attributes  An array of default HTML attributes
   *
   * @see sfWidgetFormInputFileEditable
   */
    protected function configure($options = array(), $attributes = array())
    {
        parent::configure($options, $attributes);
        
        $this->addOption('label_discard', T::__('Отменить'));
        $this->addOption('label_apply', T::__('Применить'));
        
        $this->addOption('disabled', false);
        // Add new required options
        $this->addRequiredOption('thumbs');
        $this->addRequiredOption('callback');
    }
    
    public function render($name, $value = null, $attributes = array(), $errors = array())
    {
        $disabled = $this->getOption('disabled') ? ' disabled' : '';
        $sTemplate = '<div class="jcrop_widget_c' . $disabled . '" callback="'.$this->options['callback'].'">';
        $sTemplate .= '<div rel="jcrop">%file%<br />%input%<br /></div>';
        
        // Set widget type and template
        $this->setOption('is_image', true);
        $this->setOption('template', $sTemplate);
        
        // Render parent image widget
        $input = parent::render($name, $value, $attributes, $errors); 
        $input .= "<div class='jcrop_thumb_container'>";
          
        $i=0;             
        foreach( $this->options['thumbs'] as $sKey => $aThumb )
        {
            // Checkedit mode
            if( !$this->options['edit_mode'] ) continue;
            
            // Exclude not croped preview
            if( !isset( $aThumb['method'] ) || $aThumb['method'] != 'crop' ) continue;
            
            $aThumb['ext'] = (isset($aThumb['ext']) && $aThumb['ext']) ? $aThumb['ext'] : '.' . $sKey;
            $label_apply = $this->getOption('label_apply');
            $label_discard = $this->getOption('label_discard');
            
            $input .= "<div thumbIndex='".(++$i)."'>
                           <div class='jcrop_label_size'>".$aThumb['width']."x".$aThumb['height']."</div>
                           <div class='jcrop_label_apply'>$label_apply</div>
                           <div class='jcrop_label_discard'>$label_discard</div>
                           <div class='jcrop_label_border'>
                               <img thumbIndex='".($i)."' realWidth='".$aThumb['width']."' realHeight='".$aThumb['height']."' 
                                    thumbName='".$sKey."' src='".$this->getOption('file_src') . $aThumb['ext'] ."' />
                           </div>
                       </div>";    
        }
        
        $input .= "</div><div style='clear: both;'></div></div>";
        
        return $input;
    }
}
