package edu.unsam.api

import edu.unsam.api.repository.UsuarioRepositorio
import edu.unsam.joits.domain.User

class AppBooststrap {
	def static crearContenidoInicial(){
		val User gonza = new User() => [
			username = "gonzalo"
			password = "1234"
		]
		
		UsuarioRepositorio.instance.usuarios.add(gonza)
	}
}