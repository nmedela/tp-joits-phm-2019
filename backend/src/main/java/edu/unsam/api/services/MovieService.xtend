package edu.unsam.api.services

import edu.unsam.api.repository.MovieRepository
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Movie
import java.util.List
import edu.unsam.api.repository.MovieRepositoryMongo
import edu.unsam.joits.domain.MovieMongo
import org.bson.types.ObjectId
import edu.unsam.api.repository.ScreeningSearch

class MovieService {
	def static List<MovieMongo> getMoviesByTitleSearch(String searchText) {
		return MovieRepositoryMongo.instance.searchByTitle(searchText)
	}

	def static getRecommendedMovies() {
		return MovieRepositoryMongo.instance.getRecommendedMovies()
//		return MovieRepository.instance.getRecommendedMovies()
	}

	def static getScreeningsByMovieId(String movieTitle) {
		return MovieRepositoryMongo.instance.getScreenings(new ScreeningSearch(new MovieMongo(movieTitle)))
//		return MovieRepository.instance.searchFullMovieById(movieId).screenings
	}

	def static List<MovieMongo> getMovies() {
		return MovieRepositoryMongo.instance.allInstances()
	}
}
