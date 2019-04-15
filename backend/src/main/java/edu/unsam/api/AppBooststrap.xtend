package edu.unsam.api

import edu.unsam.api.bootstrap.PeliculasBootstrap
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.User

class AppBooststrap {
	def static crearContenidoInicial() {
		/*		val movieRepository = MovieRepository.getInstance
		 * 	
		 * val screeningRepository = ScreeningRepository.getInstance
		 *  	val ticketRepository = TicketRepository.getInstance
		 * 	val Screening newScreening = new Screening => [
		 * 		date = new Date(2019 - 1900, 03, 23)
		 * 		time = LocalTime.of(10, 00)
		 * 		cinemaName = "Buenos Aires Cinema"
		 * 	]
		 * 	screeningRepository.create(newScreening)
		 * 	val movie1 = new Movie => [
		 * 		title = "La momia"
		 * 		year = 1999
		 * 		rating = 3
		 * 		genre = "Terror"
		 * 		screenings = newArrayList(newScreening)
		 * 	]
		 * 	// movie1.screenings.add(newScreening)
		 * 	val movie2 = new Movie => [
		 * 		title = "superMan"
		 * 		year = 1800
		 * 	]
		 * 	movieRepository.create(movie1)
		 * 	
		 * 	val newTicket = new Ticket => [
		 * 		screening = newScreening
		 * 		movie = movie1
		 * 		buyDate = Calendar.getInstance().getTime()
		 * 		buyTime = LocalTime.now()
		 * 	]
		 ticketRepository.create(newTicket)*/
		val userRepository = UserRepository.getInstance
		val User nico = new User => [
			name = "Nicolas"
			username = "nmedela"
			lastName = "Medela"
			password = "1234"
			age = 25
		]
		val User gonzalo = new User => [
			name = "Gonzalo"
			username = "guusygonzalo"
			password = "1234"
			lastName = "Canton"
			age = 21
			balance = 10000d
		]
		val User facundo = new User => [
			name = "Facundo"
			username = "facundo_1197"
			password = "1234"
			lastName = "Rodriguez"
			age = 21
		]

		userRepository.create(facundo)

		nico.addFriend(facundo)
		gonzalo.addFriend(nico)
		userRepository.create(nico)
		userRepository.create(gonzalo)

		PeliculasBootstrap.crearContenidoInicial()
	}

}
