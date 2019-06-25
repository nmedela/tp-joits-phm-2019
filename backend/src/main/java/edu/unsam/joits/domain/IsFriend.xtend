package edu.unsam.joits.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.annotation.RelationshipEntity
import org.neo4j.ogm.annotation.Id
import org.neo4j.ogm.annotation.GeneratedValue
import org.neo4j.ogm.annotation.StartNode
import org.neo4j.ogm.annotation.EndNode
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
@RelationshipEntity(type="ISFRIEND")
class IsFriend {
	@Id @GeneratedValue
	Long id
	
	@JsonIgnore
	@StartNode User user
	@JsonIgnore
	@EndNode User friend
}
