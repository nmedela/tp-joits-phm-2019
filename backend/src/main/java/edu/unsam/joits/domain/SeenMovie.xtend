package edu.unsam.joits.domain

import org.neo4j.ogm.annotation.RelationshipEntity
import org.neo4j.ogm.annotation.Id
import org.neo4j.ogm.annotation.GeneratedValue
import org.neo4j.ogm.annotation.StartNode
import org.neo4j.ogm.annotation.EndNode
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@RelationshipEntity(type="SAW")
class SeenMovie {
	@Id @GeneratedValue
	Long id
	@JsonIgnore
	@StartNode User user
	
	@EndNode Movie movie

//	new(){}
}
