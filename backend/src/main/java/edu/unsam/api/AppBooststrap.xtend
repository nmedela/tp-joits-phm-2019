package edu.unsam.api

import edu.unsam.api.repository.MovieRepository
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Screening
import edu.unsam.joits.domain.User
import java.time.LocalTime
import java.util.Arrays
import java.util.Date

class AppBooststrap {
	def static crearContenidoInicial() {
		val movieRepository = MovieRepository.getInstance
		
		
		val screeningRepository = ScreeningRepository.getInstance		
		val Screening newScreening = new Screening => [
			date = new Date(2019 - 1900, 03, 23)
			time = LocalTime.of(10,00)
			cinemaName = "Buenos Aires Cinema"
		]
		screeningRepository.create(newScreening)
		val movie1 = new Movie => [
			title = "La momia"
			year = 1999
			rating = 3
			genre = "Terror"
			screenings = newArrayList(newScreening)  
		]
		// movie1.screenings.add(newScreening)
		val movie2 = new Movie => [
			title = "superMan"
			year = 1800
		]
		movieRepository.create(movie1)
		
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
			balance = 10000d
		])
			userRepository.create(new User => [
			name = "Facundo"
			username = "facundo_1197"
			password = "1234"
			lastName = "Rodriguez"
			age = 21
		])

		//val nico = userRepository.searchById(0l)
		//val gonza = userRepository.searchById(1l)
		//val facundo = userRepository.searchById(2l)
		
		
		//nico.addFriend(gonza)

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
