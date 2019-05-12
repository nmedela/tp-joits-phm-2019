package edu.unsam.api.repository

import edu.unsam.joits.domain.MovieMongo
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ScreeningSearch {
	
	MovieMongo movie
	String cinemaComienzaCon
	String date
	new() {
		this(null)	
	}
	
	new(MovieMongo movie) {
		this.movie = movie
	}
	override toString() {
		var result = "Busqueda de peliculas " 
		if (date !== null) {
			result += " - funcion " + date
		}
		if (movie !== null) {
			result += " - movie " + titleMovie
		}
		if (cinemaComienzaCon !== null) {
			result += " - nombre comienza con " + cinemaComienzaCon
		}
		result		
	}
	
	def getTitleMovie() {
		this.movie.title
	}
	
}