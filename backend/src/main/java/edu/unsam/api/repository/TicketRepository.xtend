package edu.unsam.api.repository

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import edu.unsam.joits.domain.Ticket

class TicketRepository extends Repository {
	
		static TicketRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new TicketRepository
		}
		return instance
	}
	
	override getEntityType() {
		typeof (Ticket)
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery query, Root camposCandidato, Object t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override buscarId(CriteriaBuilder criteria, CriteriaQuery query, Root camposCandidato, Long id) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}