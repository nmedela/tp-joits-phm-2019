package edu.unsam.api.services

import edu.unsam.api.controllers.UserDataPost
import edu.unsam.api.exceptions.ForbiddenException
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.User

class LoginService {
	def static login(UserDataPost userData) {
		val User  user = UserRepository.instance.getUserBy(userData.username);
		if (user !== null) {
			if (user.password != userData.password) {
				throw new ForbiddenException("Usuario/password incorrecta")
			}
		} else {
			throw new ForbiddenException("Usuario/password incorrecta")

		}

	}
}
