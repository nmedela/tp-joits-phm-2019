package edu.unsam.joits.domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.ArrayList
import java.util.List
import com.fasterxml.jackson.annotation.JsonProperty
import edu.unsam.api.services.UserShort

@Accessors
class User extends Entity {

	@Accessors String name
	@Accessors String username
	@Accessors String lastName
	@Accessors String password
	@Accessors Integer age
	Double balance= 0.0
	@JsonIgnore Set<User> friends = newHashSet
	List<Movie> seenMovies = new ArrayList

	new() {
	}


	def loadBalance(Double cash){
		this.balance = this.balance + cash
	}
	def addFriend(User newUser) {
		this.friends.add(newUser)
	}

	//Ver si se hace en UserService *
	@JsonProperty("friends")
	def getFriends() {
		val Set<UserShort> friendsShort = newHashSet
		this.friends.forEach(
			friend |
				friendsShort.add(new UserShort => [
					_id = friend.id
					_name = friend.name
					_lastName = friend.lastName
				])
		)
		return friendsShort
	}

	override isValid() {
	}

}
