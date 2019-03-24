package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import edu.unsam.api.repository.UserRepository
import org.uqbar.xtrest.json.JSONUtils
import edu.unsam.api.services.UserService

@Controller
class UserController {
	extension JSONUtils = new JSONUtils

	@Get('/user/:id')
	def Result getUserById() {
		val wrappedId = Integer.valueOf(id)
		var user = UserService.getUserById(wrappedId)
		return ok(user.toJson)
	}

	@Get('/user/getFriends/:id')
	def Result getAmigos() {
		val wrappedId = Integer.valueOf(id)
		val friends = UserService.getFriendsUser(wrappedId)
		return ok(friends.toJson)
	}
}
