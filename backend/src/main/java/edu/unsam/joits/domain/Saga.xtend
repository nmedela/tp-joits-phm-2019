package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Saga extends Movie{
	Double sagaLevel
	Set<Movie> movies = newHashSet()
	
	override getPrice(){
		return movies.length * 10d + sagaLevel
	}
}