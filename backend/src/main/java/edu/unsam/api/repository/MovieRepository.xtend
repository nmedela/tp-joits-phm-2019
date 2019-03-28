package edu.unsam.api.repository

import edu.unsam.joits.domain.Movie

class MovieRepository extends Repository<Movie>{
	
	static MovieRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new MovieRepository
		}
		return instance
	}
	
	def getAll(){
		return this.repositoryContent
	}
	
	def searchByTitle(String searchText){
		return this.repositoryContent.filter[movie | movie.title.toUpperCase().contains(searchText)].toSet()
	}
	
	def getRecommendedMovies() {
		return this.repositoryContent.filter[movie | movie.recommended ].toSet()
	}
	
	override exist(Movie object) {
		return true
	}	
}