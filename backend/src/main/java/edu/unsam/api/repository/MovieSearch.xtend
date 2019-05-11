package edu.unsam.api.repository

import edu.unsam.joits.domain.MovieMongo
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ScreeningSearch {
	
	MovieMongo movie
	String cinemaComienzaCon
	String funcion
	new() {
		this(null)	
	}
	
	new(MovieMongo movie) {
		this.movie = movie
	}
	
	override toString() {
		var result = "Busqueda de jugadores " 
		if (funcion !== null) {
			result += " - funcion " + funcion
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