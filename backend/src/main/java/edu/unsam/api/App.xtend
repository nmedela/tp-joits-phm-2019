package edu.unsam.api

import org.uqbar.xtrest.api.XTRest
import edu.unsam.api.controllers.PeliculasController

class App {

	def static void main(String[] args) {
		AppBooststrap.crearContenidoInicial();
		XTRest.start(9000, PeliculasController);
	}

}
