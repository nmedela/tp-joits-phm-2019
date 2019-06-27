package edu.unsam.api.repository

import org.neo4j.ogm.cypher.Filter
import org.neo4j.ogm.cypher.ComparisonOperator
import java.util.Map
import java.util.HashMap
import java.util.List
import edu.unsam.joits.domain.User

class UserRepositoryNeo extends RepositoryNeo {
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
		val User user = session.load(typeof(User), id, 1)
		return user
	}
	
	def  getSuggested(Long id) {
		val Map<String,Long> params= new HashMap()
		params.put("id", id)
		System.out.println(params.get('id'))
		return session.query(typeof(User),
			'match (suggested:User)-->(movies:Movie)<--(me:User) WHERE ID(me) =' + id + ' and not (me)-[:ISFRIEND]->(suggested) return  suggested LIMIT 5',
			params)
	}

}
