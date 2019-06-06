package edu.unsam.api.services

import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.dtos.ShoppingCartDTO
import java.util.List
import edu.unsam.joits.domain.DateFormatArgentina
import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Screening

class TicketService {
	def static getMovie(String movie) {
		MovieRepository.instance.searchByTitleStrict(movie).get(0)
	}
	def static getScreening(String _date, String time, String _cinemaName){
		val date = DateFormatArgentina.getDateTimeFormat.parse(_date + "T"+ time + ".000-03:00");
		return new Screening(_cinemaName,date)
	}
  
	def static Ticket fromJson(Ticket ticketJson) {
		return new Ticket(getMovie(ticketJson.movieTitle), getScreening(ticketJson.date, ticketJson.time, ticketJson.cinemaName))
	}	
}
