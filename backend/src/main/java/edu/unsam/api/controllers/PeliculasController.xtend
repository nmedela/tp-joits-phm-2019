package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import org.eclipse.jetty.server.Request
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PeliculasController {

	@Get('/ping')
	def Result getEventoById(String queryParam) {
		System.out.println(queryParam)

		return ok("pong")
	}
}
