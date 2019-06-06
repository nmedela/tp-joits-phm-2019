package edu.unsam.joits.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import edu.unsam.api.services.UserShort
import java.util.List
import java.util.Set
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.ElementCollection
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Transient
import javax.persistence.ManyToMany

@Entity
@Accessors
class User {
	
    @Id @GeneratedValue
	Long id
	
	@Column(length=150)
	@Accessors String name
	@Column(length=150)
	@Accessors String username
	@Column(length=150)
	@Accessors String lastName
	@Column(length=150)
	@JsonIgnore @Accessors String password
	@Column
	@Accessors Integer age
	@Column(nullable = false)
	Double balance = 0.0
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JsonIgnore Set<User> friends = newHashSet
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL )
	Set<Ticket> tickets= newHashSet

	new() {
	}

	def loadBalance(Double cash) {
		this.balance = this.balance + cash
	}

	def addFriend(User newUser) {
		this.friends.add(newUser)
	}
	
	@JsonProperty("friends")
	def getFriends() {
		val Set<UserShort> friendsShort = newHashSet
		this.friends.forEach(friend|friendsShort.add(new UserShort(friend.id, friend.name, friend.lastName)))
		return friendsShort
	}
	@JsonProperty("tickets")
	def getTicketsJSon(){
		tickets.map[ticket | ticket.movieTitle].toSet
	}
}
