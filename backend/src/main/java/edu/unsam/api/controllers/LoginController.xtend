package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.json.JSONUtils
import edu.unsam.api.services.LoginService

@Controller
class LoginController {
	extension JSONUtils = new JSONUtils

	@Post("/login")
	def Result loginUser(@Body String userDataBody) {
		val UserDataPost userDataPost = userDataBody.fromJson(UserDataPost);
		try {
			val id = LoginService.login(userDataPost)
			val LoggedUser loggedUser = new LoggedUser();
			loggedUser.id = id
			return ok(loggedUser.toJson)
		} catch (Exception exception) {
			return forbidden();
		}
		
	}
}

@Accessors
class UserDataPost {
	String username
	String password

}
@Accessors
class LoggedUser {
	Long id

}
