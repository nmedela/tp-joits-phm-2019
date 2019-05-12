package edu.unsam.api.services

import edu.unsam.joits.domain.dtos.TicketDTO
import edu.unsam.joits.domain.Ticket
import edu.unsam.api.repository.MovieRepository
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Screening
import edu.unsam.joits.domain.dtos.ShoppingCartDTO
import java.util.List
import edu.unsam.api.repository.ScreeningRepository
import edu.unsam.api.repository.MovieRepositoryMongo

class TicketService {
//	def static List<Ticket> convertFromDTO(ShoppingCartDTO shoppingCartDTO) {
//		shoppingCartDTO.tickets.map( ticket |
//			return new Ticket(
//				MovieRepository.instance.searchById(ticket.movieId),
//				ScreeningRepository.instance.searchById(ticket.screeningId)
//			)
//		).toList
//	}

	def static List<Ticket> convertFromDTOMongo(ShoppingCartDTO shoppingCartDTO) {
		shoppingCartDTO.tickets.map( ticket |
			return new Ticket(ticket.movieTitle,ticket.date,ticket.time,ticket.cinemaName)
		).toList
	}
}
