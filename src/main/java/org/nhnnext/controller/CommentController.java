package org.nhnnext.controller;

import org.nhnnext.model.Board;
import org.nhnnext.model.Comment;
import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
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
	
	/**
	 * 
	 * @param comment	사용자가 적으려는 comment
	 * @param id		게시글의 ID
	 * @return
	 */
	@RequestMapping(value="/{id}", method=RequestMethod.POST)
	public String writeComment(Comment comment, @PathVariable Long id){
		
		Board foreignBoard = boardRepository.findOne(id);
		comment.setBoard(foreignBoard);
		
		commentdRepository.save(comment);
		
		return "redirect:/board/"+id;
	}
}
