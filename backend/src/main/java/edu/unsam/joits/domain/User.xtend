package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class User {

	@Accessors String name
	@Accessors String username
	@Accessors String lastName
	@Accessors String password
	@Accessors Integer age
	@Accessors Set<User> friends = newHashSet

	new() {
	}

}
