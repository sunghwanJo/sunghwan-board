package org.nhnnext.controller;

import javax.servlet.http.HttpSession;

import org.nhnnext.board.Board;
import org.nhnnext.board.BoardRepository;
import org.nhnnext.comment.Comment;
import org.nhnnext.comment.CommentRepository;
import org.nhnnext.user.User;
import org.nhnnext.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Comment와 관련한 기능들이 있는 Controller
 * @author josunghwan
 *
 */

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentdRepository;
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 
	 * @param comment	사용자가 적으려는 comment
	 * @param id		게시글의 ID
	 * @return
	 */
	@RequestMapping(value="/{id}", method=RequestMethod.POST)
	public String writeComment(Comment comment, @PathVariable Long id, HttpSession session){
		
		Board foreignBoard = boardRepository.findOne(id);
		User foreignUser = userRepository.findByEmail((String)session.getAttribute("email"));
		comment.setBoard(foreignBoard);
		comment.setUser(foreignUser);
		
		commentdRepository.save(comment);
		
		return "redirect:/board/list";
	}
}

