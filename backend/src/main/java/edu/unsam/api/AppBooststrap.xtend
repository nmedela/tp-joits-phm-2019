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
import edu.unsam.joits.domain.DateFormatArgentina
import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Saga
import edu.unsam.joits.domain.Screening
import edu.unsam.api.repository.MovieRepositoryNeo
import edu.unsam.api.repository.UserRepositoryNeo

class AppBooststrap {

	// TODO: hacer la creacion de saga, trayendo las pelis. Ver tema de herencia. Traer al frontend la pelocula enteras
	def static crearContenidoInicial() {
		val repoMongo = MovieRepository.instance
		val userRepository = UserRepository.instance
		val repoNeo = MovieRepositoryNeo.instance
		val repoNeoUser = UserRepositoryNeo.instance

		repoMongo.dropColection
		val cal = Calendar.getInstance()

		cal.set(2019, 05, 11, 1, 00, 0)
		val screeningMomia1 = new Screening => [
			cinemaName = "Cinemark"
			date = new Date(cal.timeInMillis)
		]
//
		cal.set(2019, 04, 10, 5, 30, 0)
		val screeningMomia2 = new Screening => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
		]

//
		cal.set(2019, 12, 10, 18, 30, 0)
		val screeningMomia3 = new Screening => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
		]
		val momia = new Movie => [
			title = "La Momia"
			year = 1999
			rating = 3
			genre = "Terror"
			screenings = newArrayList(screeningMomia1, screeningMomia2, screeningMomia3)
		]

		repoNeo.update(momia)
		repoMongo.create(momia)

//
//		// Guardians of the Galaxy-------------------------------------------		
		cal.set(2019, 08, 15, 17, 00, 0)
		val screeningGalaxy1 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Joits Miramar"
		]
		cal.set(2019, 11, 07, 9, 00, 0)
		val screeningGalaxy2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Colegio Holters"
		]
		cal.set(2019, 02, 07, 01, 30, 0)
		val screeningGalaxy3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Cinemita"
		]

		val guardiansMovie = new Movie => [
			title = "Guardians of the Galaxy"
			year = 2014
			rating = 5
			genre = "Aventura/Ciencia ficcion"
			screenings = newArrayList(screeningGalaxy1, screeningGalaxy2, screeningGalaxy3)
		]
		repoNeo.update(guardiansMovie)
		repoMongo.create(guardiansMovie)
////
////		// Interstellar------------------------------------------------------
		cal.set(2019, 07, 13, 14, 40, 0)
		val screeningInterstellar1 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Carrefour San Justo"
		]
		cal.set(2019, 06, 14, 19, 25, 0)
		val screeningInterstellar2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Municipalidad de Buenos Aires"
		]
		cal.set(2019, 09, 02, 14, 30, 0)
		val screeningInterstellar3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Teatro Colon"
		]

//
		val movieInterestelar = new Movie => [
			title = "Interstellar"
			year = 2014
			rating = 4
			genre = "Accion/Ciencia ficcion"
			screenings = newArrayList(screeningInterstellar1, screeningInterstellar2, screeningInterstellar3)
		]
		repoNeo.update(movieInterestelar)
		repoMongo.create(movieInterestelar)
//
////		// Avengers: Endgame--------------------------------------------------
		cal.set(2019, 04, 13, 20, 40, 0)
		val screeningAvengers1 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Autocine Recoleta"
		]
		cal.set(2019, 09, 14, 19, 25, 0)
		val screeningAvengers2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Sodimac Miguelete"
		]
		cal.set(2019, 01, 02, 10, 30, 0)
		val screeningAvengers3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Obelisco"
		]
//
		val movieAvenger = new Movie => [
			title = "Avengers: Endgame"
			year = 2019
			rating = 3
			genre = "Accion"
			screenings = newArrayList(screeningAvengers1, screeningAvengers2, screeningAvengers3)
		]
		repoNeo.update(movieAvenger)
		repoMongo.create(movieAvenger)
//
////		// Dragon ball super: Broly-------------------------------------------------		
		cal.set(2019, 07, 15, 16, 00, 0)
		val screeningDragon = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 08, 07, 12, 00, 0)
		val screeningDragon2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Pequines"
		]
		cal.set(2019, 10, 07, 12, 30, 0)
		val screeningDragon3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Cinemark"
		]

		val movieDragon = new Movie => [
			title = "Dragon ball super: Broly"
			year = 2019
			rating = 5
			genre = "Anime"
			screenings = newArrayList(screeningDragon, screeningDragon2, screeningDragon3)
		]
		repoNeo.update(movieDragon)
		repoMongo.create(movieDragon)

		val laMomia = repoMongo.searchByTitleStrict("La Momia")
		val dragonBall = repoMongo.searchByTitleStrict("Dragon ball super: Broly")

//		// La Momia + Guardians-----------------------------------------------------	
		cal.set(2019, 04, 01, 19, 50, 0)
		val screeningMomiaAndGuardians1 = new Screening => [
			cinemaName = "Jardin Japones"
			date = new Date(cal.timeInMillis)
		]
		cal.set(2019, 09, 17, 17, 35, 0)
		val screeningMomiaAndGuardians2 = new Screening => [
			cinemaName = "Joyts"
			date = new Date(cal.timeInMillis)
		]

		val saga = new Saga => [
			title = "La momia + Guardians"
			year = 2000
			rating = 3
			genre = "Suspenso"
			movies = newArrayList(laMomia.get(0), dragonBall.get(0))
			screenings = newArrayList(screeningMomiaAndGuardians1, screeningMomiaAndGuardians2)
			sagaLevel = 100.5d
		]
		repoNeo.update(saga)
		repoMongo.create(saga)
////
////		// El jorobado de Norte Das-------------------------------------------------		
		cal.set(2019, 04, 13, 20, 40, 0)
		val screeningJorobado = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 09, 14, 12, 35, 0)
		val screeningJorobado2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Cinema"
		]
		cal.set(2019, 05, 02, 11, 30, 0)
		val screeningJorobado3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Cinemark"
		]

		val movieJorobado = new Movie => [
			title = "Jorobado de Norte Das"
			year = 2019
			rating = 3
			genre = "Niños"
			screenings = newArrayList(screeningJorobado, screeningJorobado2, screeningJorobado3)
		]
		repoNeo.update(movieJorobado)
		repoMongo.create(movieJorobado)
////
////// El padrino 1-------------------------------------------------		
		cal.set(2019, 04, 13, 19, 40, 0)
		val screeningElPadrino = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Japones"
		]
		cal.set(2019, 09, 14, 14, 35, 0)
		val screeningElPadrino2 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Jardin Cinema"
		]
		cal.set(2019, 05, 04, 11, 30, 0)
		val screeningElPadrino3 = new Screening => [
			date = new Date(cal.timeInMillis)
			cinemaName = "Cinemark"
		]

		val moviePadrino = new Movie => [
			title = "El Padrino"
			year = 2019
			rating = 3
			genre = "Drama"
			screenings = newArrayList(screeningElPadrino, screeningElPadrino2, screeningElPadrino3)
		]
		repoNeo.update(moviePadrino)
		repoMongo.create(moviePadrino)

		val User nico = new User => [
			name = "Nicolas"
			username = "nmedela"
			lastName = "Medela"
			password = "1234"
			age = 25
			balance = 10000d
//			tickets = #[newTicket,newTicket2].toSet
		]
//
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
//
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

		repoNeoUser.update(facundo)
		userRepository.create(facundo)
		repoNeoUser.update(carlitos)
		userRepository.create(carlitos)
		repoNeoUser.update(leandro)
		userRepository.create(leandro)
		repoNeoUser.update(roberto)
		userRepository.create(roberto)
//
//		nico.addFriend(facundo)
//		gonzalo.addFriend(nico)
		repoNeoUser.update(nico)
		userRepository.create(nico)
//		userRepository.create(gonzalo)
		System.out.println("###############################" + new Date(cal.timeInMillis))
//		PeliculasBootstrap.crearContenidoInicial()
	}

}
