package br.com.projects.test.side.repositories;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import br.com.projects.side.userpermission.UserPermissionEntity;
import br.com.projects.side.userpermission.UserPermissionRepository;
import br.com.projects.test.side.utils.AbstractTest;

public class UserPermissionRepositoryTest extends AbstractTest {

	private static final Logger LOGGER = Logger.getLogger(UserPermissionRepositoryTest.class);
	
	@Autowired
	private UserPermissionRepository userPermissionRepository;
	
	@Test
	public void testFindAll(){
		List<UserPermissionEntity> userPermission = this.userPermissionRepository.findAll();
		
		LOGGER.info(userPermission);
	}
	
}
