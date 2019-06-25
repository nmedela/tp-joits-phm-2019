package edu.unsam.api.repository

import edu.unsam.joits.domain.Movie
import java.util.List
import java.util.ArrayList
import java.util.Set
import org.neo4j.ogm.cypher.Filter
import org.neo4j.ogm.cypher.ComparisonOperator
import edu.unsam.joits.domain.SeenMovie
import org.neo4j.ogm.cypher.BooleanOperator
import java.util.Map

class MovieRepositoryNeo extends AbstractRepositoryNeo {
	static MovieRepositoryNeo instance

	def static MovieRepositoryNeo getInstance() {
		if (instance === null) {
			instance = new MovieRepositoryNeo
		}
		instance
	}

	def static void main(String[] args) {
		new MovieRepositoryNeo => []
	}

	def void actualizarPelicula(Movie movie) {
		session.save(movie)
	}

	def List<Movie> searchMoviesToSee(Set<String> titles) {
		val filterMovieExist = new Filter("title", ComparisonOperator.IN, titles)
		return new ArrayList(session.loadAll(typeof(Movie), filterMovieExist, 0))
	}

}
