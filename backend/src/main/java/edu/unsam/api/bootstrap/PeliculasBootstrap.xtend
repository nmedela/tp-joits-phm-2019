package edu.unsam.api.bootstrap

import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Screening
import java.time.LocalDate
import java.time.LocalTime
import java.util.Date
import java.util.Calendar
import edu.unsam.joits.domain.Saga
import java.util.Set
import java.util.HashSet
import java.util.Arrays

class PeliculasBootstrap {
	def static crearContenidoInicial() {
		val movieRepository = MovieRepository.getInstance

		// La momia---------------------------------------------------------
		val screeningRepository = ScreeningRepository.getInstance
		val screeningMomia1 = new Screening => [
			date = new Date(2019 - 1900, 03, 23)
			time = LocalTime.of(10, 00)
			cinemaName = "Buenos Aires Cinema"
		]

		val screeningMomia2 = new Screening => [
			date = new Date(2019 - 1900, 02, 27)
			time = LocalTime.of(20, 00)
			cinemaName = "Joits recoleta"
		]

		val screeningMomia3 = new Screening => [
			date = new Date(2019 - 1900, 01, 02)
			time = LocalTime.of(20, 00)
			cinemaName = "Unicenter"
		]
		screeningRepository.create(screeningMomia1)
		screeningRepository.create(screeningMomia2)
		screeningRepository.create(screeningMomia3)

		val momiaMovie = new Movie => [
			title = "La momia"
			year = 1999
			rating = 3
			genre = "Terror"
			screenings = newArrayList(screeningMomia1, screeningMomia2, screeningMomia3)
		]
		movieRepository.create(momiaMovie)

		// Guardians of the Galaxy-------------------------------------------		
		val screeningGalaxy1 = new Screening => [
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10, 00)
			cinemaName = "Joits Miramar"
		]
		val screeningGalaxy2 = new Screening => [
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20, 00)
			cinemaName = "Colegio Holters"
		]
		val screeningGalaxy3 = new Screening => [
			date = new Date(2019 - 1900, 10, 12)
			time = LocalTime.of(22, 00)
			cinemaName = "Cinemita"
		]
		screeningRepository.create(screeningGalaxy1)
		screeningRepository.create(screeningGalaxy2)
		screeningRepository.create(screeningGalaxy3)
		val guardiansMovie = new Movie => [
			title = "Guardians of the Galaxy"
			year = 2014
			rating = 5
			genre = "Aventura/Ciencia ficcion"
			screenings = newArrayList(screeningGalaxy1, screeningGalaxy2,screeningGalaxy3)
		]
		movieRepository.create(guardiansMovie)

		// Interstellar------------------------------------------------------
		val screeningInterstellar1 = new Screening => [
			date = new Date(2019 - 1900, 03, 23)
			time = LocalTime.of(10, 00)
			cinemaName = "Carrefour San Justo"
		]
		screeningRepository.create(screeningInterstellar1)

		val screeningInterstellar2 = new Screening => [
			date = new Date(2019 - 1900, 02, 27)
			time = LocalTime.of(20, 00)
			cinemaName = "Municipalidad de Buenos Aires"
		]
		screeningRepository.create(screeningInterstellar2)

		val screeningInterstellar3 = new Screening => [
			date = new Date(2019 - 1900, 01, 02)
			time = LocalTime.of(20, 00)
			cinemaName = "Teatro Colon"
		]
		screeningRepository.create(screeningInterstellar3)

		movieRepository.create(new Movie => [
			title = "Interstellar"
			year = 2014
			rating = 4
			genre = "Accion/Ciencia ficcion"
			screenings = newArrayList(screeningInterstellar1, screeningInterstellar2, screeningInterstellar3)
		])

		// Avengers: Endgame--------------------------------------------------
		val screeningAvengers1 = new Screening => [
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10, 00)
			cinemaName = "Autocine Recoleta"
		]
		screeningRepository.create(screeningAvengers1)

		val screeningAvengers2 = new Screening => [
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20, 00)
			cinemaName = "Sodimac Miguelete"
		]
		screeningRepository.create(screeningAvengers2)

		val screeningAvengers3 = new Screening => [
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10, 00)
			cinemaName = "Obelisco"
		]
		screeningRepository.create(screeningAvengers3)

		val screeningAvengers4 = new Screening => [
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20, 00)
			cinemaName = "Radio Mitre"
		]
		screeningRepository.create(screeningAvengers4)

		movieRepository.create(new Movie => [
			title = "Avengers: Endgame"
			year = 2019
			rating = 3
			genre = "Accion"
			screenings = newArrayList(screeningAvengers1, screeningAvengers2, screeningAvengers3, screeningAvengers4)
		])

		// Dragon ball super: Broly-------------------------------------------------		
		val screeningDragon = new Screening => [
			date = new Date(2019 - 1900, 04, 12)
			time = LocalTime.of(20, 00)
			cinemaName = "Jardin Japones"
		]
		screeningRepository.create(screeningDragon)
		val screeningDragon2 = new Screening => [
			date = new Date(2019 - 1900, 04, 16)
			time = LocalTime.of(19, 00)
			cinemaName = "Jardin Pequines"
		]
		val screeningDragon3 = new Screening => [
			date = new Date(2019 - 1900, 05, 16)
			time = LocalTime.of(20, 00)
			cinemaName = "Cinemark"
		]
		screeningRepository.create(screeningDragon2)
		screeningRepository.create(screeningDragon3)
		
		movieRepository.create(new Movie => [
			title = "Dragon ball super: Broly"
			year = 2019
			rating = 5
			genre = "Anime"
			screenings = newArrayList(screeningDragon,screeningDragon2,screeningDragon3)
		])
		// La Momia + Guardians-----------------------------------------------------	
		val screeningMomiaAndGuardians1 = new Screening => [
			date = new Date(2019 - 1900, 05, 15)
			time = LocalTime.of(11, 00)
			cinemaName = "Terreno valdio"
		]
		screeningRepository.create(screeningMomiaAndGuardians1)

		val screeningMomiaAndGuardians2 = new Screening => [
			date = new Date(2019 - 1900, 12, 25)
			time = LocalTime.of(21, 45)
			cinemaName = "Cinema Las toninas"
		]
		screeningRepository.create(screeningMomiaAndGuardians2)

		movieRepository.create(new Saga => [
			title = "La momia + Guardians"
			year = 2000
			rating = 3
			genre = "Suspenso"
			movies = new HashSet<Movie>(Arrays.asList(momiaMovie, guardiansMovie))
			screenings = newArrayList(screeningMomiaAndGuardians1, screeningMomiaAndGuardians2)
			sagaLevel = 100.5d
		])


	// El jorobado de Norte Das-------------------------------------------------		
		val screeningJorobado = new Screening => [
			date = new Date(2019 - 1900, 04, 12)
			time = LocalTime.of(20, 00)
			cinemaName = "Jardin Japones"
		]
		screeningRepository.create(screeningJorobado)
		val screeningJorobado2 = new Screening => [
			date = new Date(2019 - 1900, 03, 13)
			time = LocalTime.of(19, 00)
			cinemaName = "Jardin Cinema"
		]
		val screeningJorobado3 = new Screening => [
			date = new Date(2019 - 1900, 12, 16)
			time = LocalTime.of(20, 00)
			cinemaName = "Cinemark"
		]
		screeningRepository.create(screeningJorobado2)
		screeningRepository.create(screeningJorobado3)
		
		movieRepository.create(new Movie => [
			title = "Jorobado de Norte Das"
			year = 2019
			rating = 3
			genre = "Niños"
			screenings = newArrayList(screeningJorobado,screeningJorobado2,screeningJorobado3)
		])

// El padrino 1-------------------------------------------------		
		val screeningElPadrino = new Screening => [
			date = new Date(2019 - 1900, 01, 12)
			time = LocalTime.of(20, 00)
			cinemaName = "Jardin Japones"
		]
		screeningRepository.create(screeningElPadrino)
		val screeningElPadrino2 = new Screening => [
			date = new Date(2019 - 1900, 04, 13)
			time = LocalTime.of(19, 00)
			cinemaName = "Jardin Cinema"
		]
		val screeningElPadrino3 = new Screening => [
			date = new Date(2019 - 1900, 12, 07)
			time = LocalTime.of(20, 00)
			cinemaName = "Cinemark"
		]
		screeningRepository.create(screeningElPadrino2)
		screeningRepository.create(screeningElPadrino3)
		
		movieRepository.create(new Movie => [
			title = "El Padrino"
			year = 2019
			rating = 3
			genre = "Drama"
			screenings = newArrayList(screeningElPadrino,screeningElPadrino2,screeningElPadrino3)
		])



	}
}
