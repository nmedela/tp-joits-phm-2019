package edu.unsam.joits.domain

import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.Date
import java.time.LocalTime
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class Ticket extends Entity{
	
	Screening screening	
	Double price
	
	@JsonIgnore Date buyDate
	@JsonIgnore LocalTime buyTime
	
	@JsonProperty("buyDate")
	def buyDateToString(){
		DateFormatArgentina.dateFormat.format(buyDate)	
	}
	
	@JsonProperty("buyTime")
	def buyTimeToString(){
		buyTime.toString()
	}
	
	override isValid() {}
	
	
	
}