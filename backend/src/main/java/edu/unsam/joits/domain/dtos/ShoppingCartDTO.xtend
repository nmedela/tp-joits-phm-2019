package edu.unsam.joits.domain.dtos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import edu.unsam.joits.domain.Ticket
import java.util.List

@Accessors
class ShoppingCartDTO {
	List<Ticket> tickets
}
