package edu.unsam.api.services

import edu.unsam.joits.domain.dtos.TicketDTO
import edu.unsam.joits.domain.Ticket
import edu.unsam.joits.domain.dtos.ShoppingCartDTO
import java.util.List
import edu.unsam.api.repository.MovieRepositoryMongo
import edu.unsam.joits.domain.MovieMongo
import edu.unsam.joits.domain.DateFormatArgentina

class TicketService {
	def static getMovie(String movie) {
		MovieRepositoryMongo.instance.searchByTitleStrict(movie).get(0)
	}
	def static getScreening(String movie ,String _date, String time, String _cinemaName){
		val date = DateFormatArgentina.getDateTimeFormat.parse(_date + "T"+ time + ".000-03:00");
		return MovieRepositoryMongo.instance.getScreeningBy(movie,date,_cinemaName)
	}
	def static List<Ticket> convertFromDTOMongo(ShoppingCartDTO shoppingCartDTO) {
		shoppingCartDTO.tickets.map(
			ticket |

				return new Ticket(getMovie(ticket.movieTitle), getScreening(ticket.movieTitle,ticket.date, ticket.time, ticket.cinemaName))
		).toList
	}
}
