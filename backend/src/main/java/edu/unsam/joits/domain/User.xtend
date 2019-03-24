package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.math.BigDecimal
import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class User extends Entity {
	
	 @Accessors String name = null
	 @Accessors String lastName = null
	 @Accessors Integer age = null
	Double balance = null
	@JsonIgnore Set<User> friends= newHashSet
	@JsonIgnore List<Movie> seenMovies = new ArrayList<Movie>	
	override isValid() {
	}
	
	def getFriends(){
		return this.friends
	}
	def addFriend(User newFriend){
		friends.add(newFriend)
	}
}