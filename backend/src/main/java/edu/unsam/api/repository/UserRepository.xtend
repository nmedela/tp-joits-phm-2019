package edu.unsam.api.repository

import java.util.List
import java.util.HashSet
import java.util.Set
import edu.unsam.joits.domain.User
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UserRepository extends Repository<User>{
	private new() {
	}
	static UserRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new UserRepository
		}
		return instance
	}

	def getUserBy(String username) {
		return this.repositoryContent.findFirst[ usuario | usuario.username == username ]
	}

	
	override exist(User object) {
		return true
	}

}
