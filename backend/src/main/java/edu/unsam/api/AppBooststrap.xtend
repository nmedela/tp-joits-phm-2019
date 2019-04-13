package edu.unsam.api

import edu.unsam.api.repository.UserRepository
import java.math.BigDecimal
import edu.unsam.joits.domain.User
import edu.unsam.joits.domain.Movie
import java.util.ArrayList
import edu.unsam.api.bootstrap.PeliculasBootstrap
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Ticket
import java.util.Date
import java.time.LocalDateTime
import java.util.Calendar
import java.time.LocalTime
import edu.unsam.joits.domain.Screening

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
		val User nico = new User => [
			name = "Nicolas"
			username = "nmedela"
			lastName = "Medela"
			password = "1234"
			age = 25
		]
		userRepository.create(new User => [
			name = "Gonzalo"
			username = "guusygonzalo"
			password = "1234"
			lastName = "Canton"
			age = 21
			balance = 10000d
		])
		val User facundo = new User => [
			name = "Facundo"
			username = "facundo_1197"
			password = "1234"
			lastName = "Rodriguez"
			age = 21
		]
		
		userRepository.create(facundo)
		nico.addFriend(facundo)
		userRepository.create(nico)
		
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println(" ")
		System.out.println("Aca tira algo ")
//		val nico = userRepository.searchById(0l)
		//val gonza = userRepository.searchById(1l)
		//val facundo = userRepository.searchById(2l)
		
		
//		nico.addFriend(gonza)

		//gonza.addFriend(nico)
		/*val screenRepository = ScreeningRepository.instance
		val s = new Screening => [
			date = new Date(2019 - 1900, 02, 27)
			time = LocalTime.of(20,00)
			cinemaName = "Joits recoleta"
		]
		screenRepository.create(s)
		
		movie1.screenings.add(s)
		gonza.shoppingCart.add(new Ticket(movie1,s)) */
		
		//PeliculasBootstrap.crearContenidoInicial()
		/*val repoScreen= ScreeningRepository.instance
		val funcion1 = repoScreen.searchById(0l)
		nico.shoppingHistory.add(new Ticket=>[
			screening= funcion1
			buyDate= Calendar.getInstance().getTime()
			buyTime = LocalTime.now() 
		])*/
	
	}

}
