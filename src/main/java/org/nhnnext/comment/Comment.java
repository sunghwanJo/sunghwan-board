package org.nhnnext.comment;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.nhnnext.board.Board;
import org.nhnnext.user.User;
/**
 * 
 * @author josunghwan
 *
 */
@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(length=1000, nullable=false)
	private String contents;
	
	@ManyToOne
	private Board board;
	
	@ManyToOne
	private User user;
	
	public Comment(){
		
	}

	public Comment(Board board, String contents){
		this.board = board;
		this.contents = contents;
	}

	public String getUserEmail(){
		return user.getEmail();
	}
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

}
