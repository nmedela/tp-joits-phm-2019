package edu.unsam.joits.domain

import edu.unsam.api.repository.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import java.time.LocalTime
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Calendar
import java.util.Date
import java.text.SimpleDateFormat
import java.text.DateFormat

@Accessors
class Screening extends Entity{
	@JsonIgnore final Double weekendPrice = 120d
	@JsonIgnore final Double wednesdayPrice = 50d
	@JsonIgnore final Double defaultPrice = 80d
	
	@JsonIgnore	Movie movie
	@JsonIgnore Date date
	@JsonIgnore LocalTime time
	String cinemaName
	
	@JsonProperty('date')
	def dateToString(){		
		DateFormatArgentina.dateFormat.format(date)		
	}
	
	@JsonProperty('time')
	def timeToString(){
		return this.time.toString()
	}
	
	@JsonProperty("price")
	def Double getTotalPrice(){
		return movie.getBasePrice() + this.getScreeningPrice() 
	}
	
	@JsonIgnore
	def getScreeningPrice(){
		var Calendar calObj = Calendar.getInstance()
		calObj.time = date
		switch(calObj.get(Calendar.DAY_OF_WEEK)){
			case Calendar.SUNDAY:
				return weekendPrice
				 
			case Calendar.SATURDAY: 
				return weekendPrice
			
			case Calendar.WEDNESDAY:
				return wednesdayPrice
				
			default:
				return defaultPrice
		}
	}
	
	override isValid() {		
	}
	
}