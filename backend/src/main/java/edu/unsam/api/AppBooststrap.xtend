package edu.unsam.api

import edu.unsam.api.repository.UserRepository
import java.math.BigDecimal
import edu.unsam.joits.domain.User
import edu.unsam.joits.domain.Movie
import java.util.ArrayList
import edu.unsam.api.bootstrap.PeliculasBootstrap

class AppBooststrap {
	def static crearContenidoInicial() {
		val movie1 = new Movie => [
			title = "Batman"
			year = 1960
		]
		val movie2 = new Movie => [
			title = "superMan"
			year = 1800
		]
		val userRepository = UserRepository.getInstance
		userRepository.create(new User => [
			name = "Nicolas"
			username = "nmedela"
			lastName = "Medela"
			password = "1234"
			age = 25
		])
		userRepository.create(new User => [
			name = "Gonzalo"
			username = "guusygonzalo"
			password = "1234"
			lastName = "Canton"
			age = 21
		])
			userRepository.create(new User => [
			name = "Facundo"
			username = "guusygonzalo"
			password = "1234"
			lastName = "Rodriguez"
			age = 21
		])

		val nico = userRepository.searchById(0l)
		val gonza = userRepository.searchById(1l)
		val facundo = userRepository.searchById(2l)
		
		
		nico.addFriend(gonza)
		gonza.addFriend(nico)
		
		nico.addMovie(movie1)
		nico.addMovie(movie2)
		
		PeliculasBootstrap.crearContenidoInicial()
//		nico.shoppingHistory.add(PeliculasBootstrap.get)
	}

}
