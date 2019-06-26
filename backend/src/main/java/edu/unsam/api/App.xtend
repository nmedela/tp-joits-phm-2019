package edu.unsam.api

import org.uqbar.xtrest.api.XTRest
import edu.unsam.api.controllers.PeliculasController
import edu.unsam.api.controllers.UserController
import edu.unsam.api.controllers.LoginController

class App {

	def static void main(String[] args) {
//		AppBooststrap.crearContenidoInicial();
		XTRest.start(9000, PeliculasController,UserController,LoginController);
	}

}
