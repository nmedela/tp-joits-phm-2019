package edu.unsam.api.repository

import edu.unsam.joits.domain.User
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UserRepository extends Repository<User> {

	private new() {
	}

	static UserRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new UserRepository
		}
		return instance
	}

	def User getUserBy(String username, String password) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposUser = query.from(entityType)
			query.select(camposUser).where(criteria.equal(camposUser.get("username"), username),
				criteria.equal(camposUser.get("password"), password))
			return entityManager.createQuery(query).singleResult
		} finally {
			entityManager.close
		}
	}

	override getEntityType() {
		typeof(User)
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<User> query, Root<User> camposCandidato, User t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def User searchById(Long long1) {
		// throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	override def buscarId(CriteriaBuilder criteria, CriteriaQuery<User> query, Root<User> from, Long id){
		query.where(criteria.equal(from.get("id"), id))
	}
}
