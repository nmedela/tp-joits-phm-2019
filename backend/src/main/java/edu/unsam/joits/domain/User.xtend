package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.ArrayList
import java.util.List

@Accessors
class User extends Entity {

	@Accessors String name
	@Accessors String username
	@Accessors String lastName
	@Accessors String password
	@Accessors Integer age
	@JsonIgnore Set<User> friends = newHashSet
	@JsonIgnore List<Movie> movies
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