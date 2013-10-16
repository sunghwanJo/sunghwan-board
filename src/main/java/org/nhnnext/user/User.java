package org.nhnnext.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.nhnnext.comment.Comment;
import org.nhnnext.util.EncryptUtil;

/**
 * 
 * @author josunghwan
 * 
 */
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 30, nullable = false)
	private String email;

	@Column(length = 40, nullable = false)
	private String password;

	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Comment> comments;
	
	
	User() {
	}

	public User(String email, String password) {
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

	/**
	 * Password를 Set할때 md5로 암호화해서 저장함
	 * 
	 * @param password
	 */
	public void setPassword(String password) {

		//this.password = EncryptUtil.encryptString(password);
		this.password = password;
	}

	/**
	 * 인자로 넘어온 password와 현재 password를 비교함
	 * 
	 * @param password
	 * @return
	 */
	public boolean checkPassword(String password) {

		System.out.println(password + " : " +password.length());
		System.out.println(this.getPassword() + " : " +this.getPassword().length());
		
		//if (EncryptUtil.encryptString(password) == this.getPassword()) {
		if(password.equals(this.getPassword())){
			System.out.println("비밀번호 일치함 +++");
			return true;
		}
		System.out.println("비밀번호 일치하지 않음 ---");
		return false;
	}

}
