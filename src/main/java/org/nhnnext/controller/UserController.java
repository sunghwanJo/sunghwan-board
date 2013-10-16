package org.nhnnext.controller;

import javax.servlet.http.HttpSession;

import org.nhnnext.user.User;
import org.nhnnext.user.UserRepository;
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
	
	
	/**
	 * GET요청을 받아들여서 login.jsp를 보여
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String form() {
		return "login";
	}

	/**
	 * POST요청을 받아들여서 로그인처리함. userRepository에서 email을 기반으로 user인스턴스를 가져와 checkPassowrd Method를 통해 password를 비교
	 * @param email
	 * @param password
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(String email, String password, Model model, HttpSession session) {
	
		System.out.println(email + " : " +password);
		
		User user = userRepository.findByEmail(email);
		if (user.checkPassword(password)){
			session.setAttribute("email", email);
			return "redirect:/board/list";
		};
		
		return "redirect:/";
	}

	/**
	 * Logout처리를 한 후 :/ 로 돌려보냄
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("email");
		return "redirect:/";
	}
	
	/**
	 * GET요청을 받아들여 회원가입페이지를 보여줌
	 * @return
	 */
	@RequestMapping(value = "/register")
	public String register_page() {
		
		return "register";
	}
	
	/**
	 * POST요청을 받아들여 회원을 생성함
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(User user) {
		
		//user.setPassword(user.getPassword());
		userRepository.save(user);
		
		return "redirect:/";
	}
	
}
