package br.com.projects.side.userpermission;

import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.projects.side.utils.BaseEntity;

@Entity
@Table(name = "permissao_usuario")
public class UserPermissionEntity extends BaseEntity<UserPermissionKey> {

	private static final long serialVersionUID = 1L;

}
