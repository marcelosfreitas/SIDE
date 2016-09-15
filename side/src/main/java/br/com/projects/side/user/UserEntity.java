package br.com.projects.side.user;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.projects.side.utils.BaseEntity;

@Entity
@Table(name = "usuario")
@AttributeOverride(name = "id", column = @Column(name = "uid"))
public class UserEntity extends BaseEntity<Long>{
	private static final long serialVersionUID = 1L;
	
	@Column(name = "unome", length = 45, nullable = false)
	private String name;
	
	@Column(name = "usenha", length = 45, nullable = false)
	private String password;
	
	@Column(name = "uemail", length = 100, nullable = false, unique = true)
	private String email;
	
	public UserEntity() {

	}

	public UserEntity(String name, String password, String email) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
