package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity

@Accessors
class Movie extends Entity {
	String titulo
	Integer anioRodaje
	Float puntaje
	
	override isValid() {
		
	}
	
}
