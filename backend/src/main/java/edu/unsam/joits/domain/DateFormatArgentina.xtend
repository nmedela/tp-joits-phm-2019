package edu.unsam.joits.domain

import java.text.SimpleDateFormat
import java.text.DateFormat
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DateFormatArgentina {
	static final DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy")
	
	def static getDateFormat(){
		return dateFormat
	}
}