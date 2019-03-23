package edu.unsam.api.repository

import java.util.List
import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.User

@Accessors class UsuarioRepositorio {

	@Accessors Set<User> usuarios = new HashSet<User>()
	
	private new() {
	}

	static UsuarioRepositorio instance

	static def getInstance() {
		if (instance === null) {
			instance = new UsuarioRepositorio
		}
		return instance
	}

	def User getUserBy(String username) {
		return this.usuarios.findFirst[ usuario | usuario.username == username ]
	}

}
