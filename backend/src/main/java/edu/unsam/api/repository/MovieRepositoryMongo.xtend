package edu.unsam.api.repository

import org.mongodb.morphia.Datastore
import com.mongodb.MongoClient
import org.mongodb.morphia.Morphia
import edu.unsam.joits.domain.MovieMongo
import edu.unsam.joits.domain.ScreeningMongo
import java.util.List
import java.util.ArrayList
import java.util.Date

class MovieRepositoryMongo {
	static Datastore ds
	static MovieRepositoryMongo instance

	static def getInstance() {
		if (instance === null) {
			instance = new MovieRepositoryMongo
		}
		return instance
	}

	new() {
		val mongo = new MongoClient("localhost", 27017)
		new Morphia => [
			map(MovieMongo).map(ScreeningMongo)
			ds = createDatastore(mongo, "admin") // O "local", dependiendo dónde lo corras
			ds.ensureIndexes
		]
		println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
	}

	def List<MovieMongo> allInstances() {
		ds.createQuery(MovieMongo).asList
	}

	def searchByTitle(String title) {
		ds.createQuery(MovieMongo).field("title").containsIgnoreCase(title ?: "").asList
	}

	def searchByTitleStrict(String title) {
		ds.createQuery(MovieMongo).field("title").equal(title)
	}
	def getScreeningsByMovieTitle(String title){
		val movie = searchByTitleStrict(title).get(0)
		if (movie !== null) {
			val iterator = ds.find(MovieMongo).field("movie").equal(movie.title).iterator

			if (iterator.hasNext) {
				val funciones = (iterator.next as MovieMongo).screenings
				return funciones
			}
		}
	}
	def getScreeningBy(String movie, Date date, String cinema) {
		val List<ScreeningMongo> screenings = new ArrayList<ScreeningMongo>
		val query = ds.createQuery(typeof(MovieMongo)).field("screenings.cinemaName").equal(cinema)
			.field("screenings.date").equal(date)
			.field("movie").equal(movie)
			
		val iterator = ds.createAggregation(typeof(MovieMongo)).unwind("screenings").match(query).aggregate(
			typeof(MovieMongo))
			iterator.next.screenings.get(0)
	}
	def List<MovieMongo> getRecommendedMovies() {
		return allInstances()
	}

	def static searchByScreening(ScreeningMongo screening) {
		val query = ds.createQuery(typeof(MovieMongo)).field("screenings.cinemaName").equal(screening.cinemaName).field(
			"screenings.date").equal(screening.date)

	}

}
