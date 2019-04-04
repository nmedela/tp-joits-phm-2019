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
	
	@JsonIgnore Movie movie
	int screeningId
		
	@JsonIgnore Date buyDate
	@JsonIgnore LocalTime buyTime
	
	Double price
	
	new(Movie movie, int screeningId){
		super()
		this.movie = movie
		this.screeningId = screeningId
		price = movie.getPrice() + this.movie.screenings.get(screeningId).getPrice() 
		buyDate = Calendar.getInstance().getTime()
		buyTime = LocalTime.now()
	}	
	
	/*
	@JsonProperty("buyDate")
	def buyDateToString(){
		DateFormatArgentina.dateFormat.format(buyDate)	
	}
	
	@JsonProperty("buyTime")
	def buyTimeToString(){
		buyTime.toString()
	}
	*/
	
	override isValid() {}
	
	
	
}