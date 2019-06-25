package edu.unsam.api.controllers

import edu.unsam.api.services.AddCashRequest
import edu.unsam.api.services.RequestFriends
import edu.unsam.api.services.TicketService
import edu.unsam.api.services.UserService
import edu.unsam.joits.domain.Friend
import edu.unsam.joits.domain.User
import edu.unsam.joits.domain.dtos.ShoppingCartDTO
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils
import java.util.Set
import edu.unsam.api.services.ShoppingCartService
import edu.unsam.joits.domain.Movie
import edu.unsam.api.repository.UserRepository
import edu.unsam.api.repository.UserRepositoryNeo

@Controller
class UserController {
	extension JSONUtils = new JSONUtils

	@Get('/user/:id')
	def Result getUserById() {
		val wrappedId = Long.valueOf(id)
		var user = UserService.getFullUserById(wrappedId)
		return ok(user.toJson)
	}

	@Get('/user/:id/friends/suggested')
	def Result getSuggestedFriends() {
		val wrappedId = Long.valueOf(id)
		val suggested = UserService.getSuggested()
		return ok(suggested.toJson)
	}

	@Get('/user/:id/friends')
	def Result getFriends(String name) {
		val wrappedId = Long.valueOf(id)
		val suggested = UserService.searchFriends(wrappedId, name)
		return ok(suggested.toJson)
	}

	@Get('/user/:id/movies/seen')
	def Result getSeenMovies() {
		val wrappedId = Long.valueOf(id)
		val Set<String> movies = UserService.getSeenMovies(wrappedId)
		return ok(movies.toJson)
	}

	@Put("/user/:id/friend")
	def addFriend(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val Friend newFriend = body.fromJson(Friend)
			UserService.addNewFriend(wrappedId, newFriend)
			return ok()
		} catch (Error e) {
			badRequest("Can't load friend. ")
		}
	}

	@Put("/user/:id")
	def updateUser(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val User newUser = body.fromJson(User)
			UserService.updateUser(wrappedId, newUser)
			return ok()
		} catch (Error e) {
			badRequest("Can't load cash. ")
		}
	}

	@Put("/user/:id/cash")
	def updateBalance(@Body String body) {
		val wrappedId = Long.valueOf(id)
		try {
			val AddCashRequest cash = body.fromJson(AddCashRequest)
			UserService.loadBalance(wrappedId, cash)
			val user = UserService.getUserById(wrappedId)
			return ok(user.balance.toJson)
		} catch (Error e) {
			badRequest("Can't load cash. ")
		}
	}

	@Get("/user/:userId/shoppingcart")
	def getShoppingCart() {
		val id = Long.valueOf(userId)
		return ok(ShoppingCartService.getByUserId(id).toJson)
	}

	@Post("/user/:userId/shoppingcart")
	def updateShoppingCart(@Body String body) {
		val id = Long.valueOf(userId)
		val newShoppingCart = body.fromJson(ShoppingCartDTO)
		return ok(ShoppingCartService.update(id, newShoppingCart.tickets).toJson)
	}

//	@Post("/shoppingcart/details")
//	def Result getShoppingCartDetailsBy(@Body String body) {
//		System.out.println("lo que me llego es")
//		System.out.println(body)
//
//		val newShoppingCartDTO = body.fromJson(ShoppingCartDTO)
//		val newShoppingCart = newShoppingCartDTO.tickets.map[ticketJSON | TicketService.fromJson(ticketJSON)]
//		return ok(newShoppingCart.toJson)
//	}
	@Post("/user/:userId/shoppingcart/confirm")
	def finishShopping() {
		val id = Long.valueOf(userId)
//		val user= UserRepository.instance.searchById(id)
		val newShoppingCartDTO = ShoppingCartService.getByUserId(id)
		ShoppingCartService.removeAll(id)
		val newShoppingCart = newShoppingCartDTO.map[ticketJSON|TicketService.fromJson(ticketJSON)] // ,user
		UserService.finishShopping(Long.valueOf(userId), newShoppingCart)
		return ok()
	}
}
