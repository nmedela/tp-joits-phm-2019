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

@Accessors
@Entity
class Ticket {
	@Id @GeneratedValue
	Long id

	@Column(length=150)
	String title
	@Column
	int rating
	@Column(length=150)
	String genre
	@Column
	Date date
	@Column(length=150)
	String Cinema

	@JsonIgnore @Column Date buyDate
	@JsonIgnore @Column LocalTime buyTime

	@Column
	Double price

	new(MovieMongo movie, ScreeningMongo screening) {
		this.title = movie.title
		this.rating = movie.rating
		this.genre = movie.genre
		this.date = screening.date
		this.cinema = screening.cinemaName
		price = movie.getPrice() + screening.getPrice()
		buyDate = Calendar.getInstance().getTime()
		buyTime = LocalTime.now()
	}

	new() {
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
		if(id !== null) id.hashCode else super.hashCode
	}

}
