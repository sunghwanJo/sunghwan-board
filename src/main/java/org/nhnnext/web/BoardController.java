package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;
	
	
	@RequestMapping(value="/write")
	public String write(){
		return "form";
	}
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String create(Board board){
		System.out.println("Board" + board);
		
		
		
		return "redirect:/";
	}
}
