package edu.unsam.joits.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import java.time.LocalTime
import java.util.Calendar
import java.util.Date
import javax.persistence.Entity
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column
import java.text.SimpleDateFormat
import javax.persistence.Transient

@Accessors
@Entity
//@RelationshipEntity(type="SAW")
class Ticket {
//	@org.neo4j.ogm.annotation.Id @org.neo4j.ogm.annotation.GeneratedValue
	@Id @GeneratedValue
	Long id
	
//	@org.neo4j.ogm.annotation.Transient
	@Column(length=150)
	 String movieTitle
//	@org.neo4j.ogm.annotation.Transient 
	@Transient String movieGenre
//	@org.neo4j.ogm.annotation.Transient 
	@Transient Double movieRating
//	@org.neo4j.ogm.annotation.Transient 
	@Transient Double price
//	@org.neo4j.ogm.annotation.Transient 
	@Transient String date
//	@org.neo4j.ogm.annotation.Transient 
	@Transient String time
//	@org.neo4j.ogm.annotation.Transient 
	@Transient String cinemaName
	
//	@org.neo4j.ogm.annotation.Transient 
	@JsonIgnore @Column Date buyDate
//	@org.neo4j.ogm.annotation.Transient 
	@JsonIgnore @Column LocalTime buyTime

//	@Transient 
//	@StartNode User user
//	
//	@Transient 
//	@EndNode Movie movie
	
	new(Movie movie, Screening screening) { //, User user
		this.movieTitle = movie.title
//		this.movie = movie
//		this.user = user
//		this.rating = movie.rating
//		this.genre = movie.genre
//		this.date = screening.date
//		this.cinema = screening.cinemaName

		price = movie.getPrice() + screening.getPrice()
		buyDate = Calendar.getInstance().getTime()
		buyTime = LocalTime.now()
	}

	new() {
	}


	override boolean equals(Object obj) {
		try {
			val other = obj as Ticket
			id == other?.id
		} catch (ClassCastException e) {
			return false
		}
	}

	override hashCode() {
		if(id !== null) id.hashCode else super.hashCode
	}

}
