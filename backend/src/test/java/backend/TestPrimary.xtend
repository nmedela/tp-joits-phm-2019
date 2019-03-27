package backend

import org.junit.Rule
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import edu.unsam.joits.domain.User
import edu.unsam.api.repository.UserRepository
import edu.unsam.api.repository.Repository

class TestPrimary {
	User user0
	User user1
	UserRepository repositorioUsuario

	@Before
	def void initialize() {
		user0 = new User()=>[
		name="Nicolas"
		lastName="Medela"
		age = 25
		]
		user1 = new User()=>[
		name="Gonzalo"
		lastName="Canton"
		age = 15
		]
		repositorioUsuario =  UserRepository.getInstance()
		repositorioUsuario.create(user0)
		repositorioUsuario.create(user1)
	}

	@Test
	def nombreDelUsuarioEsNicolas() {
		Assert.assertEquals("Nicolas",this.user0.getName())
	}
	@Test
	def nombreDelUsuarioNoEsCarlitos() {
		Assert.assertNotEquals("Carlitos",this.user0.getName())
	}
	
	@Test
	def buscarNombreUserConId1SeEsperaGonzalo() {
		
		Assert.assertEquals("Gonzalo",repositorioUsuario.searchById(1l).getName())
	}
}
