package edu.unsam.api.repository

import org.mongodb.morphia.Datastore
import com.mongodb.MongoClient
import org.mongodb.morphia.Morphia
import edu.unsam.joits.domain.MovieMongo
import edu.unsam.joits.domain.ScreeningMongo
import java.util.List
import java.util.ArrayList

class MovieRepositoryMongo {
	Datastore ds

	new() {
		val mongo = new MongoClient("localhost", 27017)
		new Morphia => [
			map(MovieMongo).map(ScreeningMongo)
			ds = createDatastore(mongo, "admin") // O "local", dependiendo dónde lo corras
			ds.ensureIndexes
		]
		println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
	}

	def getScreenings(ScreeningSearch screeningSearch) {
		//
		if (screeningSearch.movie !== null) {
			val iterator = ds.find(MovieMongo).field("movie").equal(screeningSearch.titleMovie).iterator

			if (iterator.hasNext) {
				val funciones = (iterator.next as MovieMongo).screenings
				println("*/Búsqueda x Equipo: " + screeningSearch.titleMovie)
				println("*/Resultado: " + funciones)
				println("****************************************")
				return funciones
			}
		}

		val cinemaComienzaCon = screeningSearch.cinemaComienzaCon
		if (cinemaComienzaCon !== null) {
			val List<ScreeningMongo> screenings = new ArrayList<ScreeningMongo>
			val query = ds.createQuery(typeof(MovieMongo)).field("screenings.cinemaName").containsIgnoreCase(cinemaComienzaCon)

			val iterator = ds.createAggregation(typeof(MovieMongo)).unwind("screenings").match(query).aggregate(
				typeof(MovieMongo))

			iterator.forEach [
				val movie = it as MovieMongo
				screenings.addAll(movie.screenings)
			]

			println("*/Búsqueda x Nombre: " + screeningSearch.cinemaComienzaCon)
			println("*/Resultado: " + screenings)
			println("****************************************")
			return screenings
		}
	}

}
