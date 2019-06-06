package edu.unsam.joits.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import java.util.Set
import org.mongodb.morphia.annotations.Embedded
import java.util.ArrayList
import java.util.List
import javax.persistence.Transient

@Accessors
class Saga extends Movie{

	Double sagaLevel
	@Embedded
	List<Movie> movies = newArrayList

	new(){
	super()
	}
	@Transient
	override getPrice() {
		return movies.length * 10d + sagaLevel
	}
}
