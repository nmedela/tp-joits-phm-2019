package edu.unsam.api.services

import edu.unsam.api.repository.UserRepository
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.User

class UserService {
	def static getUserById(Integer id){
		 UserRepository.instance.searchById(id)
	}
	
	def static getFriendsUser(Integer id){
		val user = getUserById(id)
		val friends = user.getFriends()
		val friendsShort = newHashSet
		friends.forEach(friend | friendsShort.add(new UserShort =>[
			name = friend.getName()
			lastName = friend.getLastName()
		]))
		return friendsShort
	}
}

@Accessors
class UserShort{
	String name
	String lastName	
}