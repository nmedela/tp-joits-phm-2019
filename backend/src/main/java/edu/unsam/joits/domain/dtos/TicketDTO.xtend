package edu.unsam.joits.domain.dtos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TicketDTO {
	String movieTitle
	String movieGenre
	Float movieRating
	Float price
	String date
	String time
	String cinemaName
}