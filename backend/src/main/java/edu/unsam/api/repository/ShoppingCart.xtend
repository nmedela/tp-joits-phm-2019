package edu.unsam.api.repository

import edu.unsam.joits.domain.Ticket
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.ArrayList

class ShoppingCart {
		
	static ShoppingCart instance

	static def getInstance() {
		if (instance === null) {
			instance = new ShoppingCart
		}
		return instance
	}
	
	static final Map<Long,List<Ticket>> carts =  new HashMap<Long,List<Ticket>>
	
	def void addBuyOut(Long userId, List<Ticket> tickets){
		val List<Ticket> actualShoppingCart = carts.get(userId)
		if(actualShoppingCart === null){
			carts.put(userId,tickets);
		}else{
			val List<Ticket> updatedShoppingCart = new ArrayList<Ticket>(actualShoppingCart)
			updatedShoppingCart.addAll(tickets)
			carts.replace(userId,updatedShoppingCart)		
		}
		
	}
	
	def List<Ticket> getCart(Long userId) {
		carts.get(userId)
	}
	
	
}