package edu.unsam.api.services

import edu.unsam.api.controllers.UserDataPost
import edu.unsam.api.exceptions.ForbiddenException
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.User

class LoginService {
	def static login(UserDataPost userData) {
		System.out.println("username")
		System.out.println(userData.username)
		System.out.println(userData.password)
		
		
		val User user = UserRepository.instance.getUserBy(userData.username, userData.password);
		System.out.println("user")
		System.out.println(user)

		if (user !== null) {
			return user.id
		} else {
			throw new ForbiddenException("Usuario/password incorrecta")
		}

	}
}
