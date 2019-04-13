package edu.unsam.joits.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import java.time.LocalTime
import java.util.Calendar
import java.util.Date
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Screening {
	
	@Id @GeneratedValue
	Long id
	@JsonIgnore final Double weekendPrice = 120d
	@JsonIgnore final Double wednesdayPrice = 50d
	@JsonIgnore final Double defaultPrice = 80d
	
	@JsonIgnore Date date
	@JsonIgnore LocalTime time
	
	@Column(length=150)
	String cinemaName
	
	@JsonProperty('date')
	def dateToString(){		
		DateFormatArgentina.dateFormat.format(date)		
	}
	
	@JsonProperty('time')
	def timeToString(){
		return this.time.toString()
	}	
	
	@JsonProperty('price')
	def getPrice(){
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
	
	
}