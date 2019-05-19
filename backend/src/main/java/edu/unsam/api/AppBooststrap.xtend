package edu.unsam.api

//import edu.unsam.api.repository.MovieRepository
//import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.api.repository.UserRepository
//import edu.unsam.joits.domain.Movie
//import edu.unsam.joits.domain.Saga
//import edu.unsam.joits.domain.Screening
import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.User
import java.time.LocalTime
import java.util.Arrays
import java.util.Calendar
import java.util.Date
import java.util.HashSet
import edu.unsam.api.repository.MovieRepositoryMongo
import edu.unsam.joits.domain.MovieMongo
import edu.unsam.api.repository.ScreeningSearch
import edu.unsam.joits.domain.ScreeningMongo
import edu.unsam.joits.domain.DateFormatArgentina
import edu.unsam.joits.domain.SagaMongo

class AppBooststrap {

	// TODO: hacer la creacion de saga, trayendo las pelis. Ver tema de herencia. Traer al frontend la pelocula enteras
	def static crearContenidoInicial() {
		val repoMongo = MovieRepositoryMongo.instance
		val userRepository = UserRepository.instance

		repoMongo.dropColection

		val screeningMomia1 = new ScreeningMongo => [
			cinemaName = "Cinemark"
			date = DateFormatArgentina.getDateFormat.parse("2019-05-11T01:00:00-03:00")
		]
//
		val screeningMomia2 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = DateFormatArgentina.getDateFormat.parse("2019-04-10T05:00:00-03:00")
		]

//
		val screeningMomia3 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = DateFormatArgentina.getDateFormat.parse("2019-12-10T18:30:00-03:00")
		]

		repoMongo.create(new MovieMongo => [
			title = "La Momia"
			year = 1999
			rating = 3
			genre = "Terror"
			screenings = newArrayList(screeningMomia1, screeningMomia2, screeningMomia3)
		])

//
//		// Guardians of the Galaxy-------------------------------------------		
		val screeningGalaxy1 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-08-15T17:00:00-03:00")
			cinemaName = "Joits Miramar"
		]
		val screeningGalaxy2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-11-07T09:00:00-03:00")
			cinemaName = "Colegio Holters"
		]
		val screeningGalaxy3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-02-07T01:30:00-03:00")
			cinemaName = "Cinemita"
		]

		val guardiansMovie = new MovieMongo => [
			title = "Guardians of the Galaxy"
			year = 2014
			rating = 5
			genre = "Aventura/Ciencia ficcion"
			screenings = newArrayList(screeningGalaxy1, screeningGalaxy2, screeningGalaxy3)
		]
		repoMongo.create(guardiansMovie)
//
//		// Interstellar------------------------------------------------------
		val screeningInterstellar1 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-07-13T14:40:00-03:00")
			cinemaName = "Carrefour San Justo"
		]

		val screeningInterstellar2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-06-14T19:25:00-03:00")
			cinemaName = "Municipalidad de Buenos Aires"
		]

		val screeningInterstellar3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-09-02T14:30:00-03:00")
			cinemaName = "Teatro Colon"
		]

//
		val movieInterestelar = new MovieMongo => [
			title = "Interstellar"
			year = 2014
			rating = 4
			genre = "Accion/Ciencia ficcion"
			screenings = newArrayList(screeningInterstellar1, screeningInterstellar2, screeningInterstellar3)
		]
		repoMongo.create(movieInterestelar)
//
//		// Avengers: Endgame--------------------------------------------------
		val screeningAvengers1 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-04-13T20:40:00-03:00")
			cinemaName = "Autocine Recoleta"
		]

		val screeningAvengers2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-09-14T19:25:00-03:00")
			cinemaName = "Sodimac Miguelete"
		]

		val screeningAvengers3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-01-02T10:30:00-03:00")
			cinemaName = "Obelisco"
		]
//
		val movieAvenger = new MovieMongo => [
			title = "Avengers: Endgame"
			year = 2019
			rating = 3
			genre = "Accion"
			screenings = newArrayList(screeningAvengers1, screeningAvengers2, screeningAvengers3)
		]
		repoMongo.create(movieAvenger)
//
//		// Dragon ball super: Broly-------------------------------------------------		
		val screeningDragon = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-07-15T16:00:00-03:00")
			cinemaName = "Jardin Japones"
		]
		val screeningDragon2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-08-07T12:00:00-03:00")
			cinemaName = "Jardin Pequines"
		]
		val screeningDragon3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-10-07T12:30:00-03:00")
			cinemaName = "Cinemark"
		]

		val movieDragon = new MovieMongo => [
			title = "Dragon ball super: Broly"
			year = 2019
			rating = 5
			genre = "Anime"
			screenings = newArrayList(screeningDragon, screeningDragon2, screeningDragon3)
		]
		repoMongo.create(movieDragon)

		val laMomia = repoMongo.searchByTitleStrict("La Momia")
		val dragonBall = repoMongo.searchByTitleStrict("Dragon ball super: Broly")
		
//		// La Momia + Guardians-----------------------------------------------------	
		val screeningMomiaAndGuardians1 = new ScreeningMongo => [
			cinemaName = "Jardin Japones"
			date = DateFormatArgentina.getDateFormat.parse("2019-04-01T19:50:00-03:00")
		]

		val screeningMomiaAndGuardians2 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = DateFormatArgentina.getDateFormat.parse("2019-09-17T17:35:00-03:00")
		]

		repoMongo.create(new SagaMongo => [
			title = "La momia + Guardians"
			year = 2000
			rating = 3
			genre = "Suspenso"
			movies = newArrayList(laMomia.get(0), dragonBall.get(0))
			screenings = newArrayList(screeningMomiaAndGuardians1, screeningMomiaAndGuardians2)
			sagaLevel = 100.5d
		])
//
//		// El jorobado de Norte Das-------------------------------------------------		
		val screeningJorobado = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-04-13T20:40:00-03:00")
			cinemaName = "Jardin Japones"
		]
		val screeningJorobado2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-09-14T12:35:00-03:00")
			cinemaName = "Jardin Cinema"
		]
		val screeningJorobado3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-05-02T11:30:00-03:00")
			cinemaName = "Cinemark"
		]

		val movieJorobado = new MovieMongo => [
			title = "Jorobado de Norte Das"
			year = 2019
			rating = 3
			genre = "Niños"
			screenings = newArrayList(screeningJorobado, screeningJorobado2, screeningJorobado3)
		]
		repoMongo.create(movieJorobado)
//
//// El padrino 1-------------------------------------------------		
		val screeningElPadrino = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-04-13T19:40:00-03:00")
			cinemaName = "Jardin Japones"
		]
		val screeningElPadrino2 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-09-14T14:35:00-03:00")
			cinemaName = "Jardin Cinema"
		]
		val screeningElPadrino3 = new ScreeningMongo => [
			date = DateFormatArgentina.getDateFormat.parse("2019-05-04T11:30:00-03:00")
			cinemaName = "Cinemark"
		]

		val moviePadrino = new MovieMongo => [
			title = "El Padrino"
			year = 2019
			rating = 3
			genre = "Drama"
			screenings = newArrayList(screeningElPadrino, screeningElPadrino2, screeningElPadrino3)
		]
		repoMongo.create(moviePadrino)

//
//		val newTicket = new Ticket => [
//			screening = screeningMomia1
//			movie = momiaMovie
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket2 = new Ticket => [
//			screening = screeningElPadrino
//			movie = moviePadrino
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket3 = new Ticket => [
//			screening = screeningElPadrino2
//			movie = moviePadrino
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket4 = new Ticket => [
//			screening = screeningDragon
//			movie = movieDragon
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket5 = new Ticket => [
//			screening = screeningAvengers3
//			movie = movieAvenger
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket6 = new Ticket => [
//			screening = screeningDragon2
//			movie = movieDragon
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket7 = new Ticket => [
//			screening = screeningInterstellar1
//			movie = movieInterestelar
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket8 = new Ticket => [
//			screening = screeningJorobado3
//			movie = movieJorobado
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket9 = new Ticket => [
//			screening = screeningMomia3
//			movie = momiaMovie
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
//		val newTicket10 = new Ticket => [
//			screening = screeningElPadrino2
//			movie = moviePadrino
//			buyDate = Calendar.getInstance().getTime()
//			buyTime = LocalTime.now()
//		]
		val User nico = new User => [
			name = "Nicolas"
			username = "nmedela"
			lastName = "Medela"
			password = "1234"
			age = 25
			balance = 10000d
//			tickets = #[newTicket,newTicket2].toSet
		]

		val User gonzalo = new User => [
			name = "Gonzalo"
			username = "guusygonzalo"
			password = "1234"
			lastName = "Canton"
			age = 21
			balance = 10000d
//			tickets = #[newTicket3,newTicket4].toSet
		]
		val User facundo = new User => [
			name = "Facundo"
			username = "facundo_1197"
			password = "1234"
			lastName = "Rodriguez"
			age = 21
//			tickets = #[newTicket5,newTicket6].toSet
		]

		val User carlitos = new User => [
			name = "Carlos"
			username = "carlos_redondito"
			password = "1234"
			lastName = "Pappo"
			age = 21
//			tickets = #[newTicket7,newTicket8].toSet
		]
		val User leandro = new User => [
			name = "Leandro"
			username = "leandroBaile"
			password = "1234"
			lastName = "Devoto"
			age = 21
		]
		val User roberto = new User => [
			name = "Roberto"
			username = "tito_1"
			password = "1234"
			lastName = "Puentes"
			age = 21
		]
		userRepository.create(facundo)
		userRepository.create(carlitos)
		userRepository.create(leandro)
		userRepository.create(roberto)

		nico.addFriend(facundo)
		gonzalo.addFriend(nico)
		userRepository.create(nico)
		userRepository.create(gonzalo)

//		PeliculasBootstrap.crearContenidoInicial()
	}

}
