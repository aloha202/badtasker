<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cart
 *
 * @author Алекс
 */
class Cart {

    
    protected function getUser()
    {
        return sfContext::getInstance()->getUser();
    }
    
    public function getItems()
    {
        return $this->getUser()->getAttribute('cart.items', array());
    }
    
    public function getProducts()
    {
        $items = $this->getItems();
        $q = Doctrine::getTable('Product')
                ->createQuery('p INDEXBY id')
                ->whereIn('p.id', array_keys($items))
                ;
        $products = $q->execute();
        return $products;

    }
    public function getItemsWithProducts()
    {
        $items = $this->getItems();        
        $products = $this->getProducts();
        foreach($products as $id => $product){
            if(isset($items[$id])){
                $items[$id]['product'] = $product;
            }
        }
        return $items;        
    }
    
    public function setItems($data)
    {
        $this->getUser()->setAttribute('cart.items', $data);
        return $this;
    }    
    
    public function count()
    {
        return count($this->getItems());
    }
    
    public function isEmpty()
    {
        return !$this->count();
    }
    
    public function add($item)
    {
        $key = $item['product_id'];
        $item['time'] = time();
        $data = $this->getItems();
        if(isset($data[$key])){
            $data[$key]['qty'] += $item['qty'];
        }else{
            $data[$key] = $item;
        }
        $this->setItems($data);
        return $this;
    }
    
    public function delete($id)
    {
        $data = $this->getItems();
        unset($data[$id]);
        $this->setItems($data);
        return $this;
    }
    
    public function clear()
    {
        $this->setItems(array());
        $this->getUser()->setAttribute('cart.order_data_id', null);
        $this->getUser()->setAttribute('cart.payment_method_id', null);
        $this->getUser()->setAttribute('cart.shipping_id', null);
        return $this;
    }
    
    public function changeQty($id, $qty)
    {
        $items = $this->getItems();
        if(isset($items[$id])){
            $items[$id]['qty'] = $qty;
        }
        $this->setItems($items);
        return $this;
    }
    
    public function getOrderData()
    {
        $order_data_id = $this->getUser()->getAttribute('cart.order_data_id');
        if($order_data_id){
            $data = Q::f('OrderUserData', $order_data_id);
            if($data){
                return $data;
            }
        }
        return new OrderUserData;
    }
    
    public function setOrderData($object)
    {
        $this->getUser()->setAttribute('cart.order_data_id', $object->getId());
        return $this;
    }
    
    public function setPaymentMethod($object)
    {
        $this->getUser()->setAttribute('cart.payment_method_id', $object->getId());        
        return $this;
    }
    
    public function getPaymentMethod()
    {
        $pm_id = $this->getUser()->getAttribute('cart.payment_method_id');
        if($pm_id){
            $order_pm = Q::f('OrderPaymentMethod', $pm_id);
            if($order_pm){
                return $order_pm;
            }
        }
        return new OrderPaymentMethod;
    }    
    
    public function setShipping($object)
    {
        $this->getUser()->setAttribute('cart.shipping_id', $object->getId());        
        return $this;
    }    
    
    public function getShipping()
    {
        $sh_id = $this->getUser()->getAttribute('cart.shipping_id');
        if($sh_id){
            $order_shipping = Q::f('OrderShipping', $sh_id);
            if($order_shipping){
                return $order_shipping;
            }
        }
        return new OrderShipping;
    }
    
    
    public function getTotal()
    {
        $total = 0;
        
        foreach($this->getItems() as $item){
            $total += $item['qty'] * $item['price'];
        }
        
        return $total;
    }
    
    
    public function getGrandTotal()
    {
        $grand_total = $this->getTotal();
        $shipping = $this->getShipping();
        $grand_total += $shipping->getPrice();
        
        return $grand_total;
    }
    
    public function isInCart($product)
    {
        $items = $this->getItems();
        return isset($items[$product->getId()]);
    }
}
