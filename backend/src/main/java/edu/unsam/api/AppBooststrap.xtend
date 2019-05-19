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
		val cal = Calendar.getInstance()

		cal.set(2019, 05, 11, 1, 00, 0)
		val screeningMomia1 = new ScreeningMongo => [
			cinemaName = "Cinemark"
			date = new Date(cal.timeInMillis)
		]
//
		cal.set(2019, 04, 10, 5, 30, 0)
		val screeningMomia2 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
		]

//
		cal.set(2019, 12, 10, 18, 30, 0)
		val screeningMomia3 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 08, 15, 17, 00, 0)
		val screeningGalaxy1 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Joits Miramar"
		]
		cal.set(2019, 11, 07, 9, 00, 0)
		val screeningGalaxy2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Colegio Holters"
		]
		cal.set(2019, 02, 07, 01, 30, 0)
		val screeningGalaxy3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 07, 13, 14, 40, 0)
		val screeningInterstellar1 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Carrefour San Justo"
		]
		cal.set(2019, 06, 14, 19, 25, 0)
		val screeningInterstellar2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Municipalidad de Buenos Aires"
		]
		cal.set(2019, 09, 02, 14, 30, 0)
		val screeningInterstellar3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 04, 13, 20, 40, 0)
		val screeningAvengers1 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Autocine Recoleta"
		]
		cal.set(2019, 09, 14, 19, 25, 0)
		val screeningAvengers2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Sodimac Miguelete"
		]
		cal.set(2019, 01, 02, 10, 30, 0)
		val screeningAvengers3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 07, 15, 16, 00, 0)
		val screeningDragon = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 08, 07, 12, 00, 0)
		val screeningDragon2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Pequines"
		]
		cal.set(2019, 10, 07, 12, 30, 0)
		val screeningDragon3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 04, 01, 19, 50, 0)
		val screeningMomiaAndGuardians1 = new ScreeningMongo => [
			cinemaName = "Jardin Japones"
			date = new Date(cal.timeInMillis)
		]
		cal.set(2019, 09, 17, 17, 35, 0)
		val screeningMomiaAndGuardians2 = new ScreeningMongo => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 04, 13, 20, 40, 0)
		val screeningJorobado = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 09, 14, 12, 35, 0)
		val screeningJorobado2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Cinema"
		]
		cal.set(2019, 05, 02, 11, 30, 0)
		val screeningJorobado3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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
		cal.set(2019, 04, 13, 19, 40, 0)
		val screeningElPadrino = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 09, 14, 14, 35, 0)
		val screeningElPadrino2 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Cinema"
		]
		cal.set(2019, 05, 04, 11, 30, 0)
		val screeningElPadrino3 = new ScreeningMongo => [
			date = new Date(cal.timeInMillis)
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

		System.out.println("###############################" + new Date(cal.timeInMillis))
//		PeliculasBootstrap.crearContenidoInicial()
	}

}
