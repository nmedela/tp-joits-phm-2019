package edu.unsam.joits.domain

import java.text.SimpleDateFormat
import java.text.DateFormat
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DateFormatArgentina {
	static final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd")
	static final DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");

	def static getDateFormat() {
		return dateFormat
	}

	def static getTimeFormat() {
		return hourFormat
	}
}
