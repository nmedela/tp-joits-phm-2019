package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.List

@Accessors
class Movie extends Entity {
	String title
	Integer year
	int rating
	String genre
	boolean recommended
	@JsonIgnore List<Screening> screenings = newArrayList()
	
	def getPrice(){
		return 30d
	}
	
	override isValid() {
		
	}
	
}
