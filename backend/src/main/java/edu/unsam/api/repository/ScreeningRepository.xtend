package edu.unsam.api.repository

import edu.unsam.joits.domain.Screening
import java.util.Set
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class ScreeningRepository extends Repository<Screening>{
	
	static ScreeningRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new ScreeningRepository
		}
		return instance
	}
	
	
	def getByIdRange(Set<Long> IDs){
		//return this.repositoryContent.filter(screening | IDs.findFirst(id | id as Long  === screening.id) !== null).toSet()
	}
	
	
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Screening> query, Root<Screening> camposCandidato, Screening t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def Screening  searchById(Long long1) {
		
	}
	
	override buscarId(CriteriaBuilder criteria, CriteriaQuery<Screening> query, Root<Screening> camposCandidato, Long id) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}