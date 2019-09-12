<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProductAttachmentCollectionForm
 *
 * @author Алекс
 */
class ProductImageCollectionForm extends BaseForm{
    
    public function configure(){
        if(!$product = $this->getOption('product')){
            throw new InvalidArgumentException('No product specified!');
        }
        foreach($product->getFotos() as $i => $foto){
            $form = new ProductFotoForm($foto);
            $this->embedForm('foto_' . $foto->getId(), $form);
            $this->widgetSchema->setLabel('foto_' . $foto->getId(), 'фото');
        }
        $f = new ProductFoto();
        $f->Product = $product;
        $form = new ProductFotoForm($f);
        $this->embedForm('new', $form);
        
        $this->widgetSchema->setLabel('new', 'Новое фото');
        
        $this->mergePostValidator(new ProductImageValidatorSchema());
    }    
    
}
