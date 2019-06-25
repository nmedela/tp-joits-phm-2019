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

//	def List<Movie> getPeliculas(PeliculaBusqueda peliculaBusqueda) {
//		return new ArrayList(
//			session.loadAll(typeof(Movie),algo, PROFUNDIDAD_BUSQUEDA_LISTA))
//	}
	def void actualizarPelicula(Movie movie) {
		session.save(movie)
	// ver save(entity, depth). Aquí por defecto depth es -1 que
	// implica hacer una pasada recorriendo todo el grafo en profundidad
	}

	def List<Movie> searchMoviesToSee(Set<String> titles) {
		val filterMovieExist = new Filter ("title", ComparisonOperator.IN, titles)
//		val filterMovie = new Filter("movieTitle", ComparisonOperator.MATCHES,".*")
//		val Map<String, Object> params = newHashMap
//		params.put("titles",titles )
		// Execute query and return the other side of the married relationship
//		val cypher = "MATCH (m) WHERE 'm.title' NOT( IN( $titles )) RETURN m";
//		return   session.query(typeof(Movie), cypher, params).toList
//		session.query("MATCH (movie) WHERE  movie.title NOT (exists($titles)) RETURN movie"
		return new ArrayList(session.loadAll(typeof(Movie),filterMovieExist,0))
	}

}
