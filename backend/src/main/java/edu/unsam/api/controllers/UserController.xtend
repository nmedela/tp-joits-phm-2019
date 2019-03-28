package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import edu.unsam.api.repository.UserRepository
import org.uqbar.xtrest.json.JSONUtils
import edu.unsam.api.services.UserService
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body
import edu.unsam.joits.domain.User
import edu.unsam.api.services.AddCashRequest
import edu.unsam.api.services.UserShort
import java.util.Set
import com.fasterxml.jackson.databind.ObjectMapper
import edu.unsam.api.services.RequestFriends
import edu.unsam.api.services.BalanceRequest
import org.uqbar.xtrest.api.annotation.Post
import edu.unsam.api.repository.ScreeningRepository

@Controller
class UserController {
	extension JSONUtils = new JSONUtils

	@Get('/user/:id')
	def Result getUserById() {
		val wrappedId = Long.valueOf(id)
		var user = UserService.getUserById(wrappedId)
		return ok(user.toJson)
	}

	@Get('/user/:id/friends/suggested')
	def Result getSuggestedFriends() {
		val wrappedId = Long.valueOf(id)
		val suggested = UserService.getSuggested()
		return ok(suggested.toJson)
	}

	@Put("/user/:id/friend")
	def addFriend(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val UserShort  newFriend = body.fromJson(UserShort)
			UserService.addNewFriend(wrappedId, newFriend)
			return ok()
		} catch (Error e) {
			badRequest("Can't load friend. ")
		}
	}

	@Put("/user/:id/friends")
	def addFriends(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val RequestFriends requestFriends = body.fromJson(RequestFriends)
			UserService.addNewFriends(wrappedId,requestFriends.friends )
			return ok()
		} catch (Error e) {
			badRequest("Can't load friends. ")
		}
	}

	@Put("/user/:id/cash")
	def updateBalance(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val AddCashRequest cash = body.fromJson(AddCashRequest)
			UserService.loadBalance(wrappedId, cash)
			val user = UserService.getUserById(wrappedId)
//			val BalanceRequest saldo = new BalanceRequest
//			saldo.balance = user.balance 
			return ok(user.balance.toJson)
		} catch (Error e) {
			badRequest("Can't load cash. ")
		}
	}
	
	@Get("/ShoppingCart/:userId")
	def Result getShoppingCartByUserId() {
		return ok(UserService.getUserById(Long.valueOf(userId)).shoppingCart.toJson)
	}
	
	@Get("/ShoppingCart/:userId/Details")
	def Result getShoppingCartDetailsByUserId() {
		val Set<Long> shoppingCart = UserService.getUserById(Long.valueOf(userId)).shoppingCart
		val shoppingCartDetails = ScreeningRepository.getInstance().getByIdRange(shoppingCart)
		return ok(shoppingCartDetails.toJson)
	}
	
	@Put("/ShoppingCart/:userId")
	def updateShoppingCart(@Body String body){
		val Set<Long> newShoppingCart = body.fromJson(Set)
		UserService.updateShoppingCart(Long.valueOf(userId), newShoppingCart)
		return ok()
	}
	
	@Post("/ShoppingCart/:userId")
	def finishShopping(){
		UserService.finishShopping(Long.valueOf(userId))
		return ok()
	}
}
