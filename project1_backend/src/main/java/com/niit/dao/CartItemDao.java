package com.niit.dao;

import com.niit.model.CartItem;

public interface CartItemDao {
	
	void addCartItem(CartItem cartItem);
	void removeCartItem(int cartItemId);
	void removeAllCartItem(int cartId);

}
