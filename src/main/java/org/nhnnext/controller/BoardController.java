package org.nhnnext.controller;

import javax.servlet.http.HttpSession;

import org.nhnnext.board.Board;
import org.nhnnext.board.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 * Board 관련해 게시글 올리기, 수정, 삭제, 보여주기의 역할을 하는 Controller
 * @author josunghwan
 *
 */

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired	
	private BoardRepository boardRepository;
	
	/**
	 * id값을 기반으로 게시글을 Database에서 삭제함
	 * @param id Board의 id
	 * @return redirect:/
	 */
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable Long id){
		
		boardRepository.delete(id);
		
		return "redirect:/";
	}
	
	/**
	 * 글쓰는 화면을 보여줌
	 * @return form.jsp
	 */
	@RequestMapping(value="/write")
	public String write(){
		return "form";
	}
	
	/**
	 * 
	 * @param id
	 * @param model Model임
	 * @return update.jsp
	 */
	@RequestMapping(value="/update/{id}")
	public String update(@PathVariable Long id, Model model){
		Board getBoard = boardRepository.findOne(id);
		model.addAttribute("board", getBoard);
		
		return "update";
	}
	
	/**
	 * @param board Form정보를 기반으로한 board 인스턴
	 * @param file 이미지파일
	 * @return show.jsp
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file){
		System.out.println("Board" + board);
		
		FileUploader.upload(file);
		board.setFileName(file.getOriginalFilename());
		Board savedBoard = boardRepository.save(board);
	
		return "redirect:/board/"+savedBoard.getId();
	}

	/**
	 * list를 보여준다.
	 * @param model Model임..
	 * @return list.jsp
	 */
	@RequestMapping(value="/list")
	public String list(Model model) {
		model.addAttribute("boards", boardRepository.findAll());
		model.addAttribute("comments", boardRepository.findAll());
		
		return "list";
	}
	
	/**
	 * 
	 * @param board id를 기반으로 가져온 board instance
	 * @param file	이미지파일
	 * @param id	수정하려는 Board의 id
	 * @return
	 */
	@RequestMapping(value="{id}", method=RequestMethod.POST)
	public String update(Board board, MultipartFile file, @PathVariable Long id){
		
		FileUploader.upload(file);
		//board.setFileName(file.getOriginalFilename());
		Board updateBoard = boardRepository.findOne(id);
		updateBoard.setTitle(board.getTitle());
		updateBoard.setContents(board.getContents());
		updateBoard.setFileName(file.getOriginalFilename());
		boardRepository.save(updateBoard);
		
		return "redirect:/board/"+updateBoard.getId();
	}
	
	/**
	 * 
	 * @param id	Board의 id임
	 * @param model	Model임..
	 * @return show.jsp
	 */
	@RequestMapping(value="/{id}")
	public String show(@PathVariable Long id, Model model){
		Board getBoard = boardRepository.findOne(id);
		model.addAttribute("board", getBoard);
		model.addAttribute("comments", getBoard.getComments());
		
		return "show";
	}
	
}
