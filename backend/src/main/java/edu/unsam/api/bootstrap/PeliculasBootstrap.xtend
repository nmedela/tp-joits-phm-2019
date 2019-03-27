package edu.unsam.api.bootstrap

import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Screening
import java.time.LocalDate
import java.time.LocalTime

class PeliculasBootstrap {
	def static crearContenidoInicial(){
		val movieRepository = MovieRepository.getInstance
		movieRepository.create(new Movie => [
			id = 0l
			title = "La momia"
			year = 1992
			rating = 4.3f
			genre = "Terror"
			recommended = true
		])
		
		val screeningRepository = ScreeningRepository.getInstance
		screeningRepository.create(new Screening => [
			id=0l
			movie = movieRepository.searchById(0l)
			date = LocalDate.now()
			time = LocalTime.now()
			cinemaName = "Joits recoleta"
		])
		
		screeningRepository.create(new Screening => [
			id=0l
			movie = movieRepository.searchById(0l)
			date = LocalDate.now()
			time = LocalTime.now()
			cinemaName = "Joits recoleta"
		])
	}
}