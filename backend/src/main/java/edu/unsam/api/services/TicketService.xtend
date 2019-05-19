package edu.unsam.api.services

import edu.unsam.joits.domain.dtos.TicketDTO
import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.dtos.ShoppingCartDTO
import java.util.List
import edu.unsam.api.repository.MovieRepositoryMongo
import edu.unsam.joits.domain.MovieMongo
import edu.unsam.joits.domain.DateFormatArgentina
import edu.unsam.joits.domain.ScreeningMongo

class TicketService {
	def static getMovie(String movie) {
		MovieRepositoryMongo.instance.searchByTitleStrict(movie).get(0)
	}
	def static getScreening(String _date, String time, String _cinemaName){
		val date = DateFormatArgentina.getDateTimeFormat.parse(_date + "T"+ time + ".000-03:00");
		return new ScreeningMongo(_cinemaName,date)
	}
	def static List<Ticket> convertFromDTOMongo(ShoppingCartDTO shoppingCartDTO) {
		shoppingCartDTO.tickets.map(
			ticket |
				
				return new Ticket(getMovie(ticket.movieTitle), getScreening(ticket.date, ticket.time, ticket.cinemaName))
		).toList
	}
	

	
}
