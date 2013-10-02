package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;
	
	
	@RequestMapping(value="/write")
	public String write(){
		return "form";
	}
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file){
		System.out.println("Board" + board);
		
		FileUploader.upload(file);
		board.setFileName(file.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
	
		return "redirect:/board/"+savedBoard.getId();
	}
	
	@RequestMapping(value="/{id}")
	public String show(@PathVariable Long id, Model model){
		Board getBoard = boardRepository.findOne(id);
		model.addAttribute("board", getBoard);
		
		return "show";
	}
}
