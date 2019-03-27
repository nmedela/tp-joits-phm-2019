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
	
	@Get('/Movies/Search/')
	def Result getAllMovies(){
		return ok(MovieService.getMoviesByTitleSearch("").toJson);
	}
	
	@Get('/Movies/Search/:searchText')
	def Result getMoviesBySearchText(){
		return ok(MovieService.getMoviesByTitleSearch(searchText.toUpperCase()).toJson);
	}
	
	@Get('/Movies/Recommended')
	def Result getMoviesBySearchText(){
		return ok(MovieService.getRecommendedMovies().toJson);
	}
	
	@Get('/Movies/:id/Screenings')
	def Result getMovieScreenings(){
		val _id = Long.valueOf(id)
		return ok(MovieService.getScreeningsByMovieId(_id).toJson)
	}
}
