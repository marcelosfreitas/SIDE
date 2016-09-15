package br.com.projects.test.side.repositories;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import br.com.projects.side.user.UserEntity;
import br.com.projects.side.user.UserRepository;
import br.com.projects.test.side.utils.AbstractTest;

public class UserRepositoryTest extends AbstractTest{

	private static final Logger LOGGER = Logger.getLogger(UserRepositoryTest.class);
	
	@Autowired
	private UserRepository userRepository;
	
	@Test
	public void testFindAll(){
		List<UserEntity> users = this.userRepository.findAll();
		
		LOGGER.info(users);
	}
}
