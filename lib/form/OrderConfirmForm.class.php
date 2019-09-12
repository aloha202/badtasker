<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OrderConfirmForm
 *
 * @author Алекс
 */
class OrderConfirmForm extends OrderForm{
    
    public function configure()
    {
        parent::configure();
        $this->useFields(array());
    }
    
    public function updateObject($values = null)
    {
        $object = parent::updateObject($values);
        if(sfContext::getInstance()->getUser()->isAuthenticated()){
            $object->setUserId(sfContext::getInstance()->getUser()->getGuardUser()->getId());
        }
        $cart = sfContext::getInstance()->getCart();
        $object->setTotal($cart->getTotal());
        $object->setGrandTotal($cart->getGrandTotal());
        return $object;
    }
    
    
    public function doSave($con = null)
    {
        parent::doSave($con);
        
        $cart = sfContext::getInstance()->getCart();
        $items = $cart->getItems();
        foreach($items as $item){
            $product = Q::f('Product', $item['product_id']);
            if($product){
                $op = new OrderProduct;
                $op->fromArray(array(
                    'order_id' => $this->getObject()->getId(),
                    'product_id' => $product->getId(),
                    'product_price' => $item['price'],
                    'qty' => $item['qty'],
                    'total_price' => $item['price'] * $item['qty']
                ));
                $op->save();
            }
        }
        
        $shipping = $cart->getShipping();
        $pm = $cart->getPaymentMethod();
        $data = $cart->getOrderData();
        
        $shipping->setOrderId($this->getObject()->getId())
                ->save();
        $pm->setOrderId($this->getObject()->getId())
                ->save();        
        $data->setOrderId($this->getObject()->getId())
                ->save();        
    }
    
    
}
