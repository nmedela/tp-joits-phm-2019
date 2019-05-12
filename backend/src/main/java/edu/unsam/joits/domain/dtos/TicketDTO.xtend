package edu.unsam.joits.domain.dtos

import org.eclipse.xtend.lib.annotations.Accessors
import edu.unsam.joits.domain.ScreeningMongo
import java.time.LocalTime
import java.util.Date

@Accessors
class TicketDTO {
	Long movieId
	Long screeningId
}
@Accessors
class TicketDTOMongo {
	String movieTitle
	String date
	String time
	String cinemaName
}