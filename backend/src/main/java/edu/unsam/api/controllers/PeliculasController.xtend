package edu.unsam.api.controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import edu.unsam.api.services.MovieService
import org.uqbar.xtrest.json.JSONUtils

@Controller
class PeliculasController {
	
	extension JSONUtils = new JSONUtils
	
	@Get('/ping')
	def Result getEventoById() {
		return ok("pong")
	}
	
	@Get('/Movies/:searchText')
	def Result getMoviesBySearchText(){
		return ok(MovieService.getMoviesByTitleSearch(searchText).toJson);
	}
	
	@Get('/Movies/Recommended')
	def Result getMoviesBySearchText(){
		return ok(MovieService.getRecommendedMovies().toJson);
	}
}
