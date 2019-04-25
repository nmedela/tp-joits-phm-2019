package edu.unsam.api.services

import edu.unsam.api.repository.ShoppingCart
import edu.unsam.api.repository.UserRepository
import edu.unsam.joits.domain.Friend
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.User
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

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
		UserRepository.instance.update(newUser)
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
//		 val repository = UserRepository.getInstance.repositoryContent
//		 val User newFriend = repository.findFirst [ item |
//		 	item.id == newFriendJson.id || (item.name == newFriendJson.name && item.lastName == newFriendJson.lastName)
//		 ]
		 user.addFriend(friend)
		UserRepository.instance.update(user)
	}

	// evaluar la posibilidad de que los amigos se guarden como short directamente
	def static addNewFriends(Long id, Set<UserShort> newFriendsJson) {
		val user = getUserById(id)
		val Set<User> newFriends = newHashSet
		mapperUserShortToUser(newFriendsJson).forEach[friend|user.addFriend(friend)]
	}

	def static Set<User> mapperUserShortToUser(Set<UserShort> usersShort) {
		/*val repository = UserRepository.getInstance.repositoryContent
		 * val Set<User> newFriends = newHashSet
		 * usersShort.forEach [ newFriend |
		 * 	newFriends.add(repository.findFirst [ item |
		 * 		item.id == newFriend.id || (item.name == newFriend.name && item.lastName == newFriend.lastName)
		 * 	])
		 * ]
		 return newFriends*/
	}

	def static finishShopping(Long id, List<Ticket> shoppingCart) {
		var user = getUserById(id)
		deduceBalanceFromUser(user,shoppingCart)
		ShoppingCart.instance.addBuyOut(id, shoppingCart)
	}

	def private static deduceBalanceFromUser(User user, List<Ticket> shoppingCart) {
		var Double sum = 0d;
		for (Ticket ticket : shoppingCart) {
			sum = sum + ticket.price
		}

		if (user.balance < sum)
			throw new Exception("El usuario no cuenta con fondos suficientes")

		user.balance = user.balance - sum
		UserRepository.instance.update(user)
	}

	def static Set<Movie> getSeenMovies(Long id) {
		val List<Ticket> cart = ShoppingCart.instance.getCart(id)
		if (cart === null) {
			return new HashSet
		} else {
			return cart.map(ticket|ticket.movie).toSet()

		}
	}

	def static searchFriends(Long id, String name) {
		val user = getUserById(id)
		val nameLower = name.toLowerCase()
		return user.friends.filter [ friend |
			(friend.name.toLowerCase()).contains(nameLower) || (friend.lastName.toLowerCase()).contains(nameLower)
		].toList();
	}

	def static suggestedFriends(Long id) {
		/*val user = getUserById(id)
		 return UserRepository.getInstance.repositoryContent*/
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
