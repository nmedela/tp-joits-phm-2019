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
class Ticket {
	@Id @GeneratedValue
	Long id
	
	@Column(length=150)
	 String movieTitle
	@Transient String movieGenre
	@Transient Double movieRating
	@Transient Double price
	@Transient String date
	@Transient String time
	@Transient String cinemaName
	
	@JsonIgnore @Column Date buyDate
	@JsonIgnore @Column LocalTime buyTime

	new(Movie movie, Screening screening) { //, User user
		this.movieTitle = movie.title
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
