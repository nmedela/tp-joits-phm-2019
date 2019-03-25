package edu.unsam.api.services

import edu.unsam.api.repository.MovieRepository

class MovieService {
	def static getMoviesByTitleSearch(String searchText){
		return MovieRepository.instance.searchByTitle(searchText);
	}
	
	def static getRecommendedMovies(){
		return MovieRepository.instance.getRecommendedMovies();
	}
}