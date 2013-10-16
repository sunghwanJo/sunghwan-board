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

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentdRepository;
	
	
	@RequestMapping(value="/{id}", method=RequestMethod.POST)
	public String write_comment(Comment comment, @PathVariable Long id){
		
		Board foreignBoard = boardRepository.findOne(id);
		comment.setBoard(foreignBoard);
		
		commentdRepository.save(comment);
		
		return "redirect:/board/"+id;
	}
}

