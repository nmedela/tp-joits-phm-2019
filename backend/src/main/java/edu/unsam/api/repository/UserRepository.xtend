package edu.unsam.api.repository

import edu.unsam.joits.domain.User
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.criteria.JoinType
import javax.persistence.PersistenceException
import java.util.List
import edu.unsam.joits.domain.Ticket
import java.util.Set
import edu.unsam.api.services.UserShort
import org.hibernate.criterion.Restrictions
import java.util.Arrays
import java.util.ArrayList
import javax.persistence.criteria.Predicate

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

	def User getUserByUserName(String username) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposUser = query.from(entityType)
			query.select(camposUser).where(criteria.equal(camposUser.get("username"), username))
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

	def Set<Ticket> searchTicket(Long id) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposUser = query.from(entityType)
			camposUser.fetch("tickets")
			query.select(camposUser).where(criteria.equal(camposUser.get("id"), id))
			return entityManager.createQuery(query).singleResult.tickets
		} catch (PersistenceException e) {
			return newHashSet
		} finally {
			entityManager.close
		}
	}

	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<User> query, Root<User> from, Long id) {
		from.fetch("tickets", JoinType.LEFT) //Puede que esté al pedo
		query.where(criteria.equal(from.get("id"), id))
	}

	def Set<User> searchFriends(String value, List<Long> ids) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposUser = query.from(entityType)
			query.select(camposUser).where(
				criteria.and(
					criteria.or(criteria.like(camposUser.get("name"), "%" + value + "%"),
						criteria.like(camposUser.get("lastName"), "%" + value + "%")),
					criteria.not(camposUser.get("id").in(ids))
				)
			)
			return entityManager.createQuery(query).resultList.toSet
		} finally {
			entityManager.close
		}
	}
}
