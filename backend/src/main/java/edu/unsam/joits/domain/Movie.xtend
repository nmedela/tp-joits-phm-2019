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
import org.neo4j.ogm.annotation.NodeEntity
import org.neo4j.ogm.annotation.GeneratedValue
import org.neo4j.ogm.annotation.Properties

@NodeEntity(label="Movie")
@Entity(value="movies", noClassnameStored=false)
@Accessors
class Movie implements Serializable {
	@org.neo4j.ogm.annotation.Id @GeneratedValue
	@Id Long id

	@org.neo4j.ogm.annotation.Property(name="title")
	String title
	@org.neo4j.ogm.annotation.Transient
	Integer year
	@org.neo4j.ogm.annotation.Transient
	int rating
	@org.neo4j.ogm.annotation.Transient
	String genre
	@org.neo4j.ogm.annotation.Transient
	@org.mongodb.morphia.annotations.Transient
	boolean recommended
	@org.neo4j.ogm.annotation.Transient
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
