package edu.unsam.api.services

import edu.unsam.api.repository.ShoppingCart
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.Friend
import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.User
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Arrays
import edu.unsam.joits.domain.MovieMongo

class UserService {
	def static User getUserById(Long id) {
		return UserRepository.instance.searchById(id)
	}

	def static loadBalance(Long id, AddCashRequest cash) {
		val user = getUserById(id)
		user.loadBalance(cash.amount)
	}

	def static changeAge(Long id, AgeRequest newAge) {
		val user = getUserById(id)
		user.setAge(newAge.age)
	}

	def static updateUser(Long id, User newUser) {
		val user = UserRepository.instance.searchById(id)
		user.age = newUser.age
		user.balance = newUser.balance
		UserRepository.instance.update(user)
	}

	def static getSuggested() {
		val repository = UserRepository.instance.allInstances
		val suggested = newHashSet
		repository.forEach [ user |
			suggested.add(
				new UserShort(user.getId, user.getName, user.getLastName)
			)
		]
		return suggested
	}

	def static addNewFriend(Long id, Friend newFriendJson) {
		val user = getUserById(id)
		val friend = getUserById(newFriendJson.id)
		user.addFriend(friend)
		UserRepository.instance.update(user)
	}

	// evaluar la posibilidad de que los amigos se guarden como short directamente
	def static finishShopping(Long id, List<Ticket> shoppingCart) {
		var user = getUserById(id)
		var Double sum = 0d;
		for (Ticket ticket : shoppingCart) {
			sum = sum + ticket.price
			user.tickets.add(ticket)
		}

		if (user.balance < sum)
			throw new Exception("El usuario no cuenta con fondos suficientes")

		user.balance = user.balance - sum
		UserRepository.instance.update(user)
	}

	def static Set<String> getSeenMovies(Long id) {
		val tickets = UserRepository.instance.searchTicket(id)
		val Set<String> seenMovies = newHashSet
		return seenMovies.toSet()
	}
	def static searchFriends(Long id, String value) {
		val user = getUserById(id)
		val List<Long> restrictedIds = user.friends.map[friend|friend.id].toList();
		restrictedIds.add(id);
		val usuarios = UserRepository.instance.searchFriends(value, restrictedIds)

		val suggested = newHashSet
		usuarios.forEach [ usuario |
			suggested.add(
				new UserShort(usuario.getId, usuario.getName, usuario.getLastName)
			)
		]
		return suggested
	}

}

@Accessors
class UserShort {
	@Accessors Long id
	@Accessors String name
	@Accessors String lastName

	new(Long id, String name, String lastName) {
		this.id = id
		this.name = name
		this.lastName = lastName
	}

}

@Accessors
class AddCashRequest {
	Double amount
}

@Accessors
class AgeRequest {
	Integer age
}

@Accessors
class BalanceRequest {
	Double balance
}

@Accessors
class RequestFriends {
	Set<UserShort> friends
}
