package org.nhnnext.controller;

import org.nhnnext.model.User;
import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 

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
	public String login() {
		
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
