package org.nhnnext.controller;

import javax.servlet.http.HttpSession;

import org.nhnnext.model.User;
import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
/**
 * User와 관련되어 로그인, 로그아웃, 회원가입을 하는 Controller입니다.
 * @author josunghwan
 *
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value = "/login")
	public String form() {
		return "login";
	}

	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(String email, String password, Model model, HttpSession session) {
	
		User user = userRepository.findByEmail(email);
		if (user.checkPassword(password)){
			session.setAttribute("eamil", email);
			return "redirect:/board/";
		};
		
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.removeAttribute("email");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/register")
	public String register_page() {
		
		return "register";
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(User user) {
		
		user.setPassword(user.getPassword());
		userRepository.save(user);
		
		return "redirect:/";
	}
	
}
