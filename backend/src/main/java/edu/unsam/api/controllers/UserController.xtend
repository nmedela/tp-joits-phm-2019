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

@Controller
class UserController {
	extension JSONUtils = new JSONUtils

	@Get('/user/:id')
	def Result getUserById() {
		val wrappedId = Integer.valueOf(id)
		var user = UserService.getUserById(wrappedId)
		return ok(user.toJson)
	}

	@Get('/user/:id/friends/suggested')
	def Result getSuggestedFriends() {
		val wrappedId = Integer.valueOf(id)
		val suggested = UserService.getSuggested()
		return ok(suggested.toJson)
	}

	@Put("/user/:id/friend")
	def addFriend(@Body String body) {
		val wrappedId = Integer.valueOf(id)
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
		val wrappedId = Integer.valueOf(id)
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
		val wrappedId = Integer.valueOf(id)
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

}
