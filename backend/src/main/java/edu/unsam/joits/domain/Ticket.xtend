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

@Accessors
@Entity
class Ticket {
	@Id @GeneratedValue
	Long id
	@ManyToOne
	Movie movie

	@ManyToOne
	Screening screening

	@JsonIgnore Date buyDate
	@JsonIgnore LocalTime buyTime
	
	@Column
	Double price

	new(Movie movie, Screening screening) {
		super()
		this.movie = movie
		this.screening = screening
		price = movie.getPrice() + screening.getPrice()
		buyDate = Calendar.getInstance().getTime()
		buyTime = LocalTime.now()
	}
	
	new() {
	}

	@JsonProperty("screeningId")
	def getScreeningId() {
		return screening.id
	}

	@JsonProperty("buyTime")
	def buyTimeToString() {
		buyTime.toString()
	}

	@JsonProperty("buyDate")
	def buyDateToString() {
		DateFormatArgentina.dateFormat.format(buyDate)
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
		if (id !== null) id.hashCode else super.hashCode
	}
 	

}
