package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result

@Controller
class PeliculasController {
	@Get('/ping')
	def Result getEventoById() {
		return ok("pong")
	}
}
