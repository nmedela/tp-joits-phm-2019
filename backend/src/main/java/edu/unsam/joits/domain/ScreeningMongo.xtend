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

@Accessors
@Embedded
class ScreeningMongo {

//	@Id ObjectId id
	@JsonIgnore final Double weekendPrice = 120d
	@JsonIgnore final Double wednesdayPrice = 50d
	@JsonIgnore final Double defaultPrice = 80d

	@JsonIgnore Date date
//	@JsonIgnore LocalTime time
	String cinemaName

	new() {
	}

	override toString() {
		var result = "Busqueda de peliculas "
		if (date !== null) {
			result += " - funcion " + date
		}
		if (cinemaName !== null) {
			result += " - nombre comienza con " + cinemaName
		}
		result
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
