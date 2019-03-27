package edu.unsam.joits.domain

import edu.unsam.api.repository.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import java.time.LocalTime
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class Screening extends Entity{
	
	@JsonIgnore	Movie movie
	@JsonIgnore LocalDate date
	@JsonIgnore LocalTime time
	String cinemaName
	
	@JsonProperty('date')
	def date(){
		return this.date.toString()
	}
	
	@JsonProperty('time')
	def time(){
		return this.time.toString()
	}
	
	
	override isValid() {		
	}
	
}