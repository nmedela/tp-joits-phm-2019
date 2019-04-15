package edu.unsam.joits.domain

import java.util.Set
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Saga extends Movie{
	
	@Id @GeneratedValue
	Long id
	
	@Column(length=150)
	Double sagaLevel
	
	@OneToMany(fetch=FetchType.EAGER)
	Set<Movie> movies = newHashSet()
	
	override getPrice(){
		return movies.length * 10d + sagaLevel
	}
	
}