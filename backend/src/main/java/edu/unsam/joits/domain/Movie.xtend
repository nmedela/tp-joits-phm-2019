package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity
import java.util.Set

@Accessors
class Movie extends Entity {
	String titulo
	Integer anioRodaje
	Float puntaje
	String genero
	Set<Screening> screenings = newHashSet()
	boolean recomended
	
	override isValid() {
		
	}
	
}
