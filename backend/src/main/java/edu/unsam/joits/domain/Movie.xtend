package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Property
import java.io.Serializable
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.List
import org.mongodb.morphia.annotations.Entity
import java.util.Set
import org.mongodb.morphia.annotations.Embedded
import javax.persistence.Transient

@Entity(value ="movies",noClassnameStored=false)
@Accessors
class Movie implements Serializable {

	@Id ObjectId id
//	@Property("movie")
	String title
	Integer year
	int rating
	String genre
	
	@org.mongodb.morphia.annotations.Transient
	boolean recommended

	List<Screening> screenings = newArrayList()

	new() {
	}

	new(String nombre) {
		this.title = nombre
	}
	@Transient
	def getPrice() {
			return 30d
	}

}
