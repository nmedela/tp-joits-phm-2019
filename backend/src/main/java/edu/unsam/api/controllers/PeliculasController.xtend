package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import edu.unsam.api.services.MovieService
import org.eclipse.jetty.server.Request
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import org.uqbar.xtrest.json.JSONUtils
import org.bson.types.ObjectId

@Controller
class PeliculasController {
	
	extension JSONUtils = new JSONUtils
  
	@Get('/ping')
	def Result getEventoById(String queryParam) {
		System.out.println(queryParam)

		return ok("pong")
	}
	
	@Get('/movies')
	def Result getMoviesBySearchText(String title){
		return ok(MovieService.getMoviesByTitleSearch(title).toJson);
	} // agregar el text

	@Get('/movies/recommended')
	def Result getMoviesBySearchText(){
		return ok(MovieService.getRecommendedMovies().toJson);
	}
	
		@Get('/movies/screenings')
	def Result getMovieScreeningsByTitle(String title){
		return ok(MovieService.getScreeningsByMovieTitle(title).toJson)
	}
}
