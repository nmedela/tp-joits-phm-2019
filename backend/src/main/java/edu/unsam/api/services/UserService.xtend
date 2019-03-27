package edu.unsam.api.services

import edu.unsam.api.repository.UserRepository
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.User
import java.util.Set

class UserService {
	def static getUserById(Long id) {
		UserRepository.instance.searchById(id)
	}

	def static loadBalance(Long id, AddCashRequest cash) {
		val user = getUserById(id)
		user.loadBalance(cash.amount)
	}

	def static getSuggested() {
		val repository = UserRepository.instance.repositoryContent
		val suggested = newHashSet
		repository.forEach [ user |
			suggested.add(new UserShort => [
				_id = user.getId
				_name = user.getName
				_lastName = user.getLastName
			])
		]
		return suggested
	}

	def static addNewFriend(Long id, UserShort newFriendJson) {
		val user = getUserById(id)
		val repository = UserRepository.getInstance.repositoryContent
		val User newFriend = repository.findFirst [ item |
			item.id == newFriendJson._id ||
				(item.name == newFriendJson._name && item.lastName == newFriendJson._lastName)
		]
		user.addFriend(newFriend)
	}

	// evaluar la posibilidad de que los amigos se guarden como short directamente
	def static addNewFriends(Long id, Set<UserShort> newFriendsJson) {
		val user = getUserById(id)
		val Set<User> newFriends = newHashSet
		mapperUserShortToUser(newFriendsJson).forEach[friend|user.addFriend(friend)]
	}

	def static Set<User> mapperUserShortToUser(Set<UserShort> usersShort) {
		val repository = UserRepository.getInstance.repositoryContent
		val Set<User> newFriends = newHashSet
		usersShort.forEach [ newFriend |
			newFriends.add(repository.findFirst [ item |
				item.id == newFriend._id || (item.name == newFriend._name && item.lastName == newFriend._lastName)
			])
		]
		return newFriends
	}
}

@Accessors
class UserShort {
	@Accessors Long _id
	@Accessors String _name
	@Accessors String _lastName
}

@Accessors
class AddCashRequest {
	Double amount
}

@Accessors
class RequestFriends {
	Set<UserShort> friends
}
