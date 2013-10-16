package org.nhnnext.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Home Controller입니다. index.jsp를 보여주죠
 * @author josunghwan
 *
 */

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
}
