package edu.unsam.api.services

import java.util.List
import org.bson.types.ObjectId
import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.api.repository.MovieRepositoryNeo

class MovieService {
	def static List<Movie> getMoviesByTitleSearch(String searchText) {
		return MovieRepository.instance.searchByTitle(searchText)
	}

	def static getRecommendedMovies(Long id) {
		System.out.println("Paso por el servicio")
//		return MovieRepository.instance.allInstances()		
		return MovieRepositoryNeo.instance.searchRecommended(id)
	}


	def static List<Movie> getMovies() {
		return MovieRepository.instance.allInstances()
	}
}
