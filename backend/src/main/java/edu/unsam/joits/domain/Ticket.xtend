package edu.unsam.joits.domain

import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.Date
import java.time.LocalTime
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Calendar

@Accessors
class Ticket extends Entity{
	
	Movie movie
    Screening screening
		
	@JsonIgnore Date buyDate
	@JsonIgnore LocalTime buyTime
	
	Double price
	
	new(Movie movie, Screening screening){
		super()
		this.movie = movie
		this.screening = screening
		price = movie.getPrice() + screening.getPrice() 
		buyDate = Calendar.getInstance().getTime()
		buyTime = LocalTime.now()
	}	
	
	@JsonProperty("screeningId")
	def getScreeningId(){
		return screening.id
	}
	
	@JsonProperty("buyTime")
	def buyTimeToString(){
		buyTime.toString()
	}
	@JsonProperty("buyDate")
	def buyDateToString(){
		DateFormatArgentina.dateFormat.format(buyDate)
	}
	
	
	
	override isValid() {}
	
	
	
}