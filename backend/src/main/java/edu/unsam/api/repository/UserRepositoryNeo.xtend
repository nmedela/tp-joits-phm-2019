package edu.unsam.api.repository

import edu.unsam.joits.domain.User
import org.neo4j.ogm.cypher.Filter
import org.neo4j.ogm.cypher.ComparisonOperator
import java.util.Set
import java.util.ArrayList
import edu.unsam.joits.domain.SeenMovie

class UserRepositoryNeo extends AbstractRepositoryNeo {
	static UserRepositoryNeo instance

	def static UserRepositoryNeo getInstance() {
		if (instance === null) {
			instance = new UserRepositoryNeo
		}
		instance
	}

	def static void main(String[] args) {
		new UserRepositoryNeo => []
	}

	def void update(User user) {
		session.save(user)
	}
	def  getUserById(Long id){
		val filerByUserId = new Filter("id", ComparisonOperator.MATCHES, id)
		val User user = session.load(typeof(User), id, 1)
		return user
	}
	def searchSeenMoviesByUserId(Long id) {
		val filerByUserId = new Filter("id", ComparisonOperator.MATCHES, id)
		val User user = session.load(typeof(User), id, 1)
		return user.seenMovies

	}

}
