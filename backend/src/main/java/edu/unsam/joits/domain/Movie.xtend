package edu.unsam.joits.domain

import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Movie {
	
	@Id @GeneratedValue
	Long id
	@Column(length=150)
	String title
	@Column(length=150)
	Integer year
	@Column(length=150)
	int rating
	@Column(length=150)
	String genre
	
	@Transient boolean recommended
	
	@OneToMany(fetch=FetchType.LAZY)
	@JsonIgnore List<Screening> screenings = newArrayList()
	
	def getPrice(){
		return 30d
	}
	
}
