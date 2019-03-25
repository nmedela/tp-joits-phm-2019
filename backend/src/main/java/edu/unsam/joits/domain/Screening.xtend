package edu.unsam.joits.domain

import java.time.LocalDateTime
import edu.unsam.api.repository.Entity

class Screening extends Entity{
	Movie movie;
	LocalDateTime dateTime;
	String cinemaName
	
	override isValid() {		
	}
	
}