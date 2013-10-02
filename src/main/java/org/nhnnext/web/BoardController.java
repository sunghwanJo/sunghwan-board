package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@RequestMapping(value="/write")
	public String write(){
		return "form";
	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String create(Board board){
		System.out.println("Board [WTF]: " + board);
		System.out.println("TEST");
		System.out.println("Board [tostring]: " + board.toString());
		
		return "redirect:/";
	}
}
