package edu.unsam.api

import edu.unsam.api.repository.UserRepository
import java.math.BigDecimal
import edu.unsam.joits.domain.User

class AppBooststrap {
	def static crearContenidoInicial(){
		val userRepository = UserRepository.getInstance
		userRepository.create(new User => [
			name = "Nicolas"
			lastName="Medela"
			age = 25
		])
		userRepository.create(new User => [
			name = "Gonzalo"
			lastName="Canton"
			age = 21
		])
		val nico = userRepository.searchById(0)
		val gonza = userRepository.searchById(1)
//		nico.addFriend(gonza)
	}
	
}