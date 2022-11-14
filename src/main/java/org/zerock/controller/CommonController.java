package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg", "이 페이지는 접근할 수 없는 페이지입니다.");
	} // /accessError.jsp

	// 애플리케이션에서 정의한 페이지를 사용
	// error, logout : 여러가지 경우에 의하여 로그인 페이지로 올 수가 있다.
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "아이디와 비밀번호가 맞지않습니다.");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	} // url 페이지 : /customLogin.jsp

	// security 기능에서 /customLogout url과 POST 메소드로 와야지 로그아웃 처리가 된다.
	// 여기서는 로그아웃  폼을 만들어서 로그아웃 메뉴를 클릭하면 /customLogout POST 전송이 되도록
	// 버튼을 누르면 바로 /customLogout POST로 보내도록 할 수도 있다. (로그아웃 폼을 사용하지 않고)
	// 로그아웃 폼을 보내준다.
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
	}

}
