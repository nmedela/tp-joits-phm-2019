package edu.unsam.api.repository

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.config.Configuration
import org.neo4j.ogm.session.SessionFactory

@Accessors
abstract class RepositoryNeo {

	static Configuration configuration = new Configuration.Builder().uri("bolt://localhost").credentials("neo4j","").build()

	public static SessionFactory sessionFactory = new SessionFactory(configuration, "edu.unsam.joits.domain")

	protected def getSession() {
		sessionFactory.openSession
	}

}
