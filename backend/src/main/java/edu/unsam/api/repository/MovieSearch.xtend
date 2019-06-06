package edu.unsam.api.repository

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.Movie

@Accessors
class ScreeningSearch {
	
	Movie movie
	String cinemaComienzaCon
	String date
	new() {
		this(null)	
	}
	
	new(Movie movie) {
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