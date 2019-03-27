package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity
import java.util.Set

@Accessors
class Movie extends Entity {
	String title
	Integer year
	Float rating
	String genre
	Set<Screening> screenings = newHashSet()
	boolean recommended
	
	override isValid() {
		
	}
	
}
