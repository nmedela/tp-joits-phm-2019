package edu.unsam.api.services

import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig
import edu.unsam.joits.domain.Ticket
import java.util.List
import org.uqbar.xtrest.json.JSONUtils
import redis.clients.jedis.Jedis
import java.util.Set

class ShoppingCartService {
	static extension JSONUtils = new JSONUtils		
	static Jedis jedis = new Jedis("localhost")
	
	def static getKey(Long id){
		return "user-"+id.toString
	}
	
	def static List<Ticket> getByUserId(Long userID){
		jedis.lrange(getKey(userID), 0, -1).map[ticketJson | return ticketJson.fromJson(Ticket)].toList
	}
	
	def static update(Long userID, List<Ticket> tickets){
		val key = getKey(userID)
		
		if (jedis.exists(key))
			jedis.del(key)
		
		if(tickets.size > 0)
			jedis.rpush(key, tickets.map[ ticket | ticket.toJson ])
	}	
	
	def static removeAll(Long userID){
		jedis.del(getKey(userID))
	}
}