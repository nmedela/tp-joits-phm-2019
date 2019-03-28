package edu.unsam.api.services

import edu.unsam.api.repository.UserRepository
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.User
import java.util.Set
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.joits.domain.Screening
import edu.unsam.joits.domain.Ticket
import java.util.Date
import java.util.Calendar
import java.time.LocalTime

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
	
	def static updateShoppingCart(Long id, Set<Long> newShoppingCart){
		getUserById(id).shoppingCart = newShoppingCart
	}
	
	def static finishShopping(Long id){
		var user = getUserById(id)		
		val shoppingCart = ScreeningRepository.getInstance().getByIdRange(user.shoppingCart)
		
		deduceBalanceFromUser(user, shoppingCart)
		addTicketsToShoppingHistory(user, shoppingCart)		
		cleanShoppingCart(user)
	}
	
	
	def private static addTicketsToShoppingHistory(User user, Iterable<Screening> screenings) {
		user.shoppingHistory.addAll(screenings.map[scr | new Ticket => [
			screening = scr	
			price = scr.totalPrice
			buyDate = Calendar.getInstance().getTime()
			buyTime	= LocalTime.now()		 
		]])
	}
	
	def private static deduceBalanceFromUser(User user, Iterable<Screening> shoppingCart){
		var Double sum = 0d;
		for(Screening screening: shoppingCart){
			sum = sum + screening.totalPrice
		}
		
		if(user.balance < sum)
			throw new Exception("El usuario no cuenta con fondos suficientes")
		
		user.balance = user.balance - sum
	}
	
	def private static cleanShoppingCart(User user) {
		user.shoppingCart.removeAll()
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
