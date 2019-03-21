package backend

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
@Accessors
class User {
	
	@Accessors String name
	@Accessors String lastName
	@Accessors Integer age
	@Accessors Set<User> amigos= newHashSet
	
	new(){}
	
}