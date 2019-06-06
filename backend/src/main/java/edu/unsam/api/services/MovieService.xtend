package edu.unsam.api.services

import java.util.List
import org.bson.types.ObjectId
import edu.unsam.api.repository.ScreeningSearch
import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie

class MovieService {
	def static List<Movie> getMoviesByTitleSearch(String searchText) {
		return MovieRepository.instance.searchByTitle(searchText)
	}

	def static getRecommendedMovies() {
		return MovieRepository.instance.getRecommendedMovies()
	}

//	def static getScreeningsByMovieTitle(String movieTitle) {
//		return MovieRepositoryMongo.instance.getScreeningsByMovieTitle(movieTitle)
//	}

	def static List<Movie> getMovies() {
		return MovieRepository.instance.allInstances()
	}
}
