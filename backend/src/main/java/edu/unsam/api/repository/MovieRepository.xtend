package edu.unsam.api.repository

import edu.unsam.joits.domain.Movie
import java.util.List
import javax.persistence.PersistenceException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import javax.persistence.criteria.JoinType

class MovieRepository extends Repository<Movie> {

	static MovieRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new MovieRepository
		}
		return instance
	}

	def getAll() {
		// return this.repositoryContent
	}

	def List<Movie> searchByTitle(String title) {
		val Movie searchMovie = new Movie()
		searchMovie.title = title
		return this.searchBy(searchMovie)
	}

	def Movie searchById(Long id) {
		return this.searchById2(id)
	}

	def Movie searchFullMovieById(Long id) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			from.fetch("screenings", JoinType.LEFT)
			query.select(from)
			query.where(criteria.equal(from.get('id'), id))
			entityManager.createQuery(query).singleResult
		} catch (PersistenceException e) {
			e.printStackTrace
			entityManager.transaction.rollback
			throw new RuntimeException("Ocurrió un error, la operación no puede completarse", e)
		} finally {
			entityManager.close
		}
	}

	def getRecommendedMovies() {
		return allInstances
	}

	override getEntityType() {
		typeof(Movie)
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Movie> query, Root<Movie> camposCandidato,
		Movie movie) {
		if (movie.title !== null) {
			query.where(criteria.like(camposCandidato.get("title"), "%" + movie.title + "%"))
		}
	}

	override buscarId(CriteriaBuilder criteria, CriteriaQuery<Movie> query, Root<Movie> camposCandidato, Long id) {
		query.where(criteria.equal(camposCandidato.get("id"), id))
	}

}
