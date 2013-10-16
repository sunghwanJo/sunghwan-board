package org.nhnnext.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.nhnnext.util.EncryptUtil;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(length=30, nullable=false)
	private String email;
	
	@Column(length=40, nullable=false)
	private String password;

	User(){}
	
	public User(String email, String password){
		this.password = EncryptUtil.encryptString(password);
		this.email = email;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
	
		return password;
	}

	public void setPassword(String password) {
		
		this.password = EncryptUtil.encryptString(password);
	}

	public boolean checkPassword(String password){
		
		if(EncryptUtil.encryptString(password) == this.getPassword()){
			return true;
		}
		
		return false;
	}
	
}
