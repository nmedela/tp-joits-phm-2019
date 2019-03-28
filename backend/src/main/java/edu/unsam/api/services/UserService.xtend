package edu.unsam.api.services

import edu.unsam.api.repository.UserRepository
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.User
import java.util.Set

class UserService {
	def static getUserById(Integer id) {
		UserRepository.instance.searchById(id)
	}

	def static loadBalance(Integer id, AddCashRequest cash) {
		val user = getUserById(id)
		user.loadBalance(cash.amount)
	}

	def static getSuggested() {
		val repository = UserRepository.instance.repositoryContent
		val suggested = newHashSet
		repository.forEach [ user |
			suggested.add(
				new UserShort(user.getId, user.getName, user.getLastName)
			)
		]
		return suggested
	}

	def static addNewFriend(Integer id, UserShort newFriendJson) {
		val user = getUserById(id)
		val repository = UserRepository.getInstance.repositoryContent
		val User newFriend = repository.findFirst [ item |
			item.id == newFriendJson.id ||
				(item.name == newFriendJson.name && item.lastName == newFriendJson.lastName)
		]
		user.addFriend(newFriend)
	}

	// evaluar la posibilidad de que los amigos se guarden como short directamente
	def static addNewFriends(Integer id, Set<UserShort> newFriendsJson) {
		val user = getUserById(id)
		val Set<User> newFriends = newHashSet
		mapperUserShortToUser(newFriendsJson).forEach[friend|user.addFriend(friend)]
	}

	def static Set<User> mapperUserShortToUser(Set<UserShort> usersShort) {
		val repository = UserRepository.getInstance.repositoryContent
		val Set<User> newFriends = newHashSet
		usersShort.forEach [ newFriend |
			newFriends.add(repository.findFirst [ item |
				item.id == newFriend.id || (item.name == newFriend.name && item.lastName == newFriend.lastName)
			])
		]
		return newFriends
	}
}

@Accessors
class UserShort {

	@Accessors int id
	@Accessors String name
	@Accessors String lastName

	new(int id, String name, String lastName) {
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
class BalanceRequest {
	Double balance
}

@Accessors
class RequestFriends {
	Set<UserShort> friends
}
