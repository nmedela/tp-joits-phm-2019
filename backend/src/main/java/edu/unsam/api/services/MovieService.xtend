package edu.unsam.api.services

import edu.unsam.api.repository.MovieRepository
import edu.unsam.api.repository.ScreeningRepository

class MovieService {
	def static getMoviesByTitleSearch(String searchText){
		if(searchText == "")
			return MovieRepository.instance.getAll()
		else
			return MovieRepository.instance.searchByTitle(searchText)
	}
	
	def static getRecommendedMovies(){
		return MovieRepository.instance.getRecommendedMovies()
	}
	
	def static getScreeningsByMovieId(Long movieId) {
		return MovieRepository.instance.searchById(movieId).screenings
	}
	
}