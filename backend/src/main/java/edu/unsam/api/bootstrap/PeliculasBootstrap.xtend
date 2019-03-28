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
	def static crearContenidoInicial(){
		val movieRepository = MovieRepository.getInstance
		movieRepository.create(new Movie => [
			title = "La momia"
			year = 1999
			rating = 3
			genre = "Terror"
			recommended = true
		])
		movieRepository.create(new Movie => [
			title = "Guardians of the Galaxy"
			year = 2014
			rating = 5
			genre = "Aventura/Ciencia ficcion"
			recommended = false
		])
		movieRepository.create(new Movie => [
			title = "Interstellar"
			year = 2014
			rating = 4
			genre = "Accion/Ciencia ficcion"
			recommended = false
		])
		movieRepository.create(new Movie => [
			title = "Avengers: Endgame"
			year = 2019
			rating = 3
			genre = "Accion"
			recommended = false
		])
		movieRepository.create(new Movie => [
			title = "Dragon ball super: Broly"
			year = 2019
			rating = 5
			genre = "Anime"
			recommended = true
		])
		movieRepository.create(new Saga => [
			title = "La momia + Guardians"
			year = 2000
			rating = 3
			genre = "Suspenso"
			recommended = true
			movies = new HashSet<Movie>(Arrays.asList(movieRepository.searchById(0l), movieRepository.searchById(1l)))
			sagaLevel = 100.5d
		])	
				
		//La momia---------------------------------------------------------
		val screeningRepository = ScreeningRepository.getInstance
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(0l)
			date = new Date(2019 - 1900, 03, 23)
			time = LocalTime.of(10,00)
			cinemaName = "Buenos Aires Cinema"
		])		
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(0l)
			date = new Date(2019 - 1900, 02, 27)
			time = LocalTime.of(20,00)
			cinemaName = "Joits recoleta"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(0l)
			date = new Date(2019 - 1900, 01, 02)
			time = LocalTime.of(20,00)
			cinemaName = "Unicenter"
		])
		
		//Guardians of the Galaxy-------------------------------------------		
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(1l)
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10,00)
			cinemaName = "Joits Miramar"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(1l)
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20,00)
			cinemaName = "Colegio Holters"
		])
		
		//Interstellar------------------------------------------------------		
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(2l)
			date = new Date(2019 - 1900, 03, 23)
			time = LocalTime.of(10,00)
			cinemaName = "Carrefour San Justo"
		])		
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(2l)
			date = new Date(2019 - 1900, 02, 27)
			time = LocalTime.of(20,00)
			cinemaName = "Municipalidad de Buenos Aires"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(2l)
			date = new Date(2019 - 1900, 01, 02)
			time = LocalTime.of(20,00)
			cinemaName = "Teatro Colon"
		])
		
		//Avengers: Endgame--------------------------------------------------	
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(3l)
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10,00)
			cinemaName = "Autocine Recoleta"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(3l)
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20,00)
			cinemaName = "Sodimac Miguelete"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(3l)
			date = new Date(2019 - 1900, 06, 10)
			time = LocalTime.of(10,00)
			cinemaName = "Obelisco"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(3l)
			date = new Date(2019 - 1900, 10, 22)
			time = LocalTime.of(20,00)
			cinemaName = "Radio Mitre"
		])
		
		//Dragon ball super: Broly-------------------------------------------------		
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(4l)
			date = new Date(2019 - 1900, 04, 12)
			time = LocalTime.of(20,00)
			cinemaName = "Jardin Japones"
		])
		
		//La Momia + Guardians-----------------------------------------------------	
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(5l)
			date = new Date(2019 - 1900, 05, 15)
			time = LocalTime.of(11,00)
			cinemaName = "Terreno valdio"
		])
		screeningRepository.create(new Screening => [
			movie = movieRepository.searchById(5l)
			date = new Date(2019 - 1900, 12, 25)
			time = LocalTime.of(21,45)
			cinemaName = "Cinema Las toninas"
		])
	}
}