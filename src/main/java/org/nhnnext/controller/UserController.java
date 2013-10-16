package org.nhnnext.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@RequestMapping(value = "/form")
	public String form() {
		return "login.jsp";
	}

	@RequestMapping(value = "/login")
	public String login() {
		/**
		 * // TODO userId에 해당하는 사용를 데이터베이스에서 조회 
		 * // TODO 사용자가 입력한 비밀번호와 데이터베이스에서
		 * 조회한 사용자 비밀번호가 같은지 확인 session.setAttribute("userId", userId); return
		 */
		
		
		
		return "redirect:/";
	}

	@RequestMapping(value = "/register")
	public String register() {
		return "";
	}
}
