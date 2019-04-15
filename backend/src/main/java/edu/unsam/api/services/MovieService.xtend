package edu.unsam.api.services

import edu.unsam.api.repository.MovieRepository
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Movie
import java.util.List

class MovieService {
	def static List<Movie> getMoviesByTitleSearch(String searchText){		
		if(searchText == "")
			return MovieRepository.instance.allInstances()
		else
			return MovieRepository.instance.searchByTitle(searchText)
	}
	
	def static getRecommendedMovies(){
		return MovieRepository.instance.getRecommendedMovies()
	}
	
	def static getScreeningsByMovieId(Long movieId) {
		return MovieRepository.instance.searchFullMovieById(movieId).screenings
	}
	
}