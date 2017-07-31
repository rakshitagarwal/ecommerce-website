package com.niit.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CartItemDao;
import com.niit.model.Cart;
import com.niit.model.CartItem;
@Service
@Transactional
public class CartItemServiceImpl implements CartItemService {
	@Autowired
	private CartItemDao cartItemDao;

	@Override
	public void addCartItem(CartItem cartItem) {
		cartItemDao.addCartItem(cartItem);
	}

	@Override
	public void removeCartItem(int cartItemId) {
		cartItemDao.removeCartItem(cartItemId);
		
	}

	@Override
	public void removeAllCartItems(int cartId) {
		cartItemDao.removeAllCartItem(cartId);
		
	}

	@Override
	public Cart getCart(int cartId) {
		return cartItemDao.getCart(cartId);
	}

}
