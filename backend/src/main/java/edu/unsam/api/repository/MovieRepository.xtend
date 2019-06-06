package edu.unsam.api.repository

import org.mongodb.morphia.Datastore
import com.mongodb.MongoClient
import org.mongodb.morphia.Morphia
import java.util.List
import java.util.ArrayList
import java.util.Date
import edu.unsam.joits.domain.Movie
import edu.unsam.joits.domain.Saga
import edu.unsam.joits.domain.Screening

class MovieRepository {
	static Datastore ds
	static MovieRepository instance

	static def getInstance() {
		if (instance === null) {
			instance = new MovieRepository
		}
		return instance
	}

	new() {
		val mongo = new MongoClient("localhost", 27017)
		new Morphia => [
			map(Movie).map(Screening)
			ds = createDatastore(mongo, "admin") // O "local", dependiendo dónde lo corras
			ds.ensureIndexes
		]
		println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
	}
	def create(Movie saga){
		ds.save(saga)	}

	def List<Movie> allInstances() {
		ds.createQuery(Movie).asList
	}

	def searchByTitle(String title) {
		ds.createQuery(Movie).field("title").containsIgnoreCase(title ?: "").asList
	}

	def searchByTitleStrict(String title) {
		ds.createQuery(Movie).field("title").equal(title).asList
	}
	

	def List<Movie> getRecommendedMovies() {
		return allInstances()
	}

	def static searchByScreening(Screening screening) {
		val query = ds.createQuery(typeof(Movie)).field("screenings.cinemaName").equal(screening.cinemaName).field(
			"screenings.date").equal(screening.date)

	}
	def dropColection(){
		ds.getCollection(Movie).drop
	}
}
