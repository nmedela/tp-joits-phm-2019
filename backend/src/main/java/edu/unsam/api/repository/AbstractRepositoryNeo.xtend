package edu.unsam.api.repository

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.config.Configuration
import org.neo4j.ogm.session.SessionFactory

@Accessors
abstract class AbstractRepositoryNeo {

	/**
	 * Al buscar muchos elementos, buscaremos por defecto traer solo la información de ese nodo, por eso 0.
	 * Al buscar un nodo concreto, la profundidad será 1 para traer el nodo y sus relaciones
	 */
	public static int PROFUNDIDAD_BUSQUEDA_LISTA = 0
	public static int PROFUNDIDAD_BUSQUEDA_CONCRETA = 1

	static Configuration configuration = new Configuration.Builder().uri("bolt://localhost").credentials("neo4j",
		"").build()

	public static SessionFactory sessionFactory = new SessionFactory(configuration, "edu.unsam.joits.domain")

	protected def getSession() {
		sessionFactory.openSession
	}

}
