package edu.unsam.api.repository

import edu.unsam.joits.domain.Movie
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class MovieRepository extends Repository<Movie>{
	
	static MovieRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new MovieRepository
		}
		return instance
	}
	
	def getAll(){
		//return this.repositoryContent
	}
	
	def Movie searchByTitle(String searchText){
		//return this.repositoryContent.filter[movie | movie.title.toUpperCase().contains(searchText)].toSet()
	}
	def Movie searchById(Long id){
		//return this.repositoryContent.filter[movie | movie.title.toUpperCase().contains(searchText)].toSet()
	}
	
	def getRecommendedMovies() {
		//return this.repositoryContent.filter[movie | movie.recommended ].toSet()
	}
	

	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Movie> query, Root<Movie> camposCandidato, Movie t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}