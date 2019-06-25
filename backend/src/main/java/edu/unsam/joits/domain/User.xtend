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
import org.neo4j.ogm.annotation.NodeEntity
import org.neo4j.ogm.annotation.Relationship

@NodeEntity(label="User")
@Entity
@Accessors
class User {
	@org.neo4j.ogm.annotation.Id @org.neo4j.ogm.annotation.GeneratedValue
	@Id
	Long id

	@org.neo4j.ogm.annotation.Property(name="name")
	@Column(length=150)
	@Accessors String name

//	@org.neo4j.ogm.annotation.Property(name="username")
	@org.neo4j.ogm.annotation.Transient
	@Column(length=150)
	@Accessors String username

	@org.neo4j.ogm.annotation.Property(name="lastName")
	@Column(length=150)
	@Accessors String lastName

	@org.neo4j.ogm.annotation.Transient
	@Column(length=150)
	@JsonIgnore @Accessors String password

	@org.neo4j.ogm.annotation.Transient
	@Column
	@Accessors Integer age
	@org.neo4j.ogm.annotation.Transient
	@Column(nullable=false)
	Double balance = 0.0

//	@org.neo4j.ogm.annotation.Transient
//	@ManyToMany(fetch=FetchType.LAZY)
	@Transient
	@Relationship(type="ISFRIEND", direction=Relationship.OUTGOING)
	@JsonIgnore
	Set<IsFriend> friends = newHashSet

	@org.neo4j.ogm.annotation.Transient
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JsonIgnore
	Set<Ticket> tickets = newHashSet

	@Relationship(type="SAW", direction=Relationship.OUTGOING)
	@Transient
	@JsonIgnore
	Set<SeenMovie> seenMovies = newHashSet

	new() {
	}

	def loadBalance(Double cash) {
		this.balance = this.balance + cash
	}

	def addNewFriend(User _friend) {
		val newFriend = new IsFriend => [
			user = this
			friend = _friend
		]
		this.friends.add(newFriend)
	}

//	def addFriend(User newUser) {
//		this.friends.add(newUser)
//	}
	def addFriends(Set<IsFriend> _friends) {
		this.friends = _friends
	}

	@JsonIgnore
	def getRelationFriend() {
		return this.friends
	}

	@JsonProperty("friends")
	def getFriends() {
		return this.friends.map[relation|relation.friend].toSet

	}

//	@JsonProperty("tickets")
//	def getTicketsJSon() {
//		tickets.map[ticket|ticket.movieTitle].toSet
//	}

	@JsonProperty("tickets")
	def getMovies() {
		return this.seenMovies.map[relation|relation.movie.title].toSet

	}

	def addSeenMovie(Movie _movie) {
		val seenMovie = new SeenMovie => [
			movie = _movie
			user = this
		]
		this.seenMovies.add(seenMovie)
	}

	def addSeenMovies(Set<SeenMovie> movies) {
		seenMovies = movies
	}
}
