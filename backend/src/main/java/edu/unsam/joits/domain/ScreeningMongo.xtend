package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.Date
import java.time.LocalTime
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Calendar
import javax.persistence.Transient

@Accessors
@Embedded
class ScreeningMongo {
	@org.mongodb.morphia.annotations.Transient @JsonIgnore final Double weekendPrice = 120d
	@org.mongodb.morphia.annotations.Transient @JsonIgnore final Double wednesdayPrice = 50d
	@org.mongodb.morphia.annotations.Transient @JsonIgnore final Double defaultPrice = 80d

	@JsonIgnore Date date
	String cinemaName

	new() {
	}
	
	new(String _cinemaName , Date _date){
		this.cinemaName = _cinemaName
		this.date = _date
	}

	@JsonProperty('date')
	def dateToString(){		
		DateFormatArgentina.dateFormat.format(date)		
	}
//	
	@JsonProperty('time')
	def timeToString(){
		DateFormatArgentina.timeFormat.format(date)
	}	
	
	@JsonProperty('price')
	@Transient def getPrice(){
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
