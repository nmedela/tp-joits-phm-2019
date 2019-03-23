package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
@Accessors
class Usuario {
	
	@Accessors String name
	@Accessors String lastName
	@Accessors Integer age
	@Accessors Set<Usuario> amigos= newHashSet
	
	new(){}
	
}