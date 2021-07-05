package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home");
		
		return "login";
	}
	
	@GetMapping("/logout")
	public String out(HttpSession session) {
		log.info("로그 아웃 시도 ");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/main/home")
	public void home() {
		log.info("메인 페이지로 이동합니다.");
	}
	
	@GetMapping("/self/profile")
	public void profile() {
		log.info("프로필 페이지로 이동합니다.");
	}
}
