package br.com.projects.side.userpermission;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import br.com.projects.side.utils.BaseKey;

@Embeddable
public class UserPermissionKey extends BaseKey{
	
	private static final long serialVersionUID = 1L;

	@Column(name = "permissao_idpermissao")
	private Long permissionId;
	
	@Column(name = "usuario_uid")
	private Long userId;

	public UserPermissionKey() {
	}

	public UserPermissionKey(Long permissionId, Long userId) {
		super();
		this.permissionId = permissionId;
		this.userId = userId;
	}

	public Long getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	
}
