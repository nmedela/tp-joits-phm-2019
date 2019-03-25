package edu.unsam.api.repository

import org.eclipse.xtend.lib.annotations.Accessors
@Accessors abstract class Entity {
	@Accessors int id

	def void isValid()
}
