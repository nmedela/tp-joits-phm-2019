package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity

@Accessors
class User extends Entity {

	@Accessors String name
	@Accessors String username
	@Accessors String lastName
	@Accessors String password
	@Accessors Integer age
	@Accessors Set<User> friends = newHashSet

	new() {
	}
	
	def  addFriend(User newUser) {
		this.friends.add(newUser)
	}
	def getFriends(){
		return this.friends
	}
	
	override isValid() {
	}

}
