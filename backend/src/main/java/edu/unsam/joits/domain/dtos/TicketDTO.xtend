package edu.unsam.joits.domain.dtos

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.ScreeningMongo
import java.time.LocalTime
import java.util.Date

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