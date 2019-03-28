package edu.unsam.api

import edu.unsam.api.repository.UserRepository
import java.math.BigDecimal
import edu.unsam.joits.domain.User
import edu.unsam.api.bootstrap.PeliculasBootstrap

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
			username="guusygonzalo"
			password="1234"
			lastName="Canton"
			age = 21
		])
		val nico = userRepository.searchById(0l)
		val gonza = userRepository.searchById(1l)
//		nico.addFriend(gonza)
		
		PeliculasBootstrap.crearContenidoInicial()
	}
	
}