package edu.unsam.api.repository

import edu.unsam.joits.domain.Screening

class ScreeningRepository extends Repository<Screening>{
	
	static ScreeningRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new ScreeningRepository
		}
		return instance
	}
	
	def getAll(){
		return this.repositoryContent
	}
	
	def getByMovieId(Long id){
		return this.repositoryContent.filter(screening | screening.movie.id == id).toSet()
	}
	
	override exist(Screening object) {
		return true
	}
}