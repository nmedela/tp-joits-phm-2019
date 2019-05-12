package edu.unsam.api.services

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
	}

	def static getScreeningsByMovieTitle(String movieTitle) {
		return MovieRepositoryMongo.instance.getScreeningsByMovieTitle(movieTitle)
	}

	def static List<MovieMongo> getMovies() {
		return MovieRepositoryMongo.instance.allInstances()
	}
}
