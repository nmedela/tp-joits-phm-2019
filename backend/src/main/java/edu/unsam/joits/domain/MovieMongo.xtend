package edu.unsam.joits.domain

import org.mongodb.morphia.annotations.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Property
import java.io.Serializable
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.List

@Entity("movies")
@Accessors
class MovieMongo implements Serializable {
		
	@Id ObjectId id
	@Property("movie")
	String title
	Integer year
	int rating
	String genre
	
	boolean recommended

	@JsonIgnore List<ScreeningMongo> screenings = newArrayList()
	new(){
		
	}
	new(String nombre) {
		this.title = nombre
	}
	def getPrice(){
		return 30d
	}
	
	
}