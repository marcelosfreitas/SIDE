package br.com.projects.test.side.repositories;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.projects.side.permission.PermissionEntity;
import br.com.projects.side.permission.PermissionRepository;
import br.com.projects.test.side.utils.AbstractTest;

public class PermissionReposistoryTest extends AbstractTest{

	private static final Logger LOGGER = Logger.getLogger(PermissionReposistoryTest.class);
	
	@Autowired
	private PermissionRepository permissionRepository;
	
	@Test
	public void testFindAll(){
		List<PermissionEntity> permissions = this.permissionRepository.findAll();
		
		LOGGER.info(permissions);
	}
}
