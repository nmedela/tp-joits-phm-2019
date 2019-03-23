package backend

import org.junit.Rule
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import edu.unsam.joits.domain.User

class TestPrimary {
	User user1

	@Before
	def void initialize() {
		user1 = new User()=>[
		name="Nicolas"
		lastName="asdd"
		age = 25
		
		]
	}

	@Test
	def nombreDelUsuarioEsNicolas() {
		Assert.assertEquals("Nicolas",this.user1.getName())
	}
	@Test
	def nombreDelUsuarioNoEsCarlitos() {
		Assert.assertNotEquals("Carlitos",this.user1.getName())
	}
}
