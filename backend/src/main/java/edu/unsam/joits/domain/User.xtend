package edu.unsam.joits.domain

import java.util.Set
import java.util.List
import edu.unsam.api.services.UserShort
import edu.unsam.api.repository.Entity
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class User extends Entity {

	@Accessors String name
	@Accessors String username
	@Accessors String lastName
	@Accessors String password
	@Accessors Integer age
	Double balance = 0.0
	@JsonIgnore Set<User> friends = newHashSet
	List<Ticket> shoppingCart = newArrayList()
	List<Ticket> shoppingHistory = newArrayList()

	new() {
	}

	def loadBalance(Double cash) {
		this.balance = this.balance + cash
	}

	def addFriend(User newUser) {
		this.friends.add(newUser)
	}

	// Ver si se hace en UserService *
	@JsonProperty("friends")
	def getFriends() {
		val Set<UserShort> friendsShort = newHashSet
		this.friends.forEach(friend|friendsShort.add(new UserShort(friend.id, friend.name, friend.lastName)))
		return friendsShort
	}
	
	override isValid() {
	}

}
