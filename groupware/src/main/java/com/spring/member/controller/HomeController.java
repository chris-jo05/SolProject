package com.spring.member.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageVO;
import com.spring.board.service.BoardService;
import com.spring.member.domain.MemberVo;
import com.spring.member.service.MemberService;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private BoardService b_service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home");
		
		return "login";
	}
	
	 @PostMapping("/login") 
	 public String login(MemberVo vo,HttpSession session,RedirectAttributes rttr) {
		 
		 log.info("로그인 시도 " + vo);
	 
		 MemberVo login = service.login(vo);
		 
		 if(login == null) { 
			 rttr.addFlashAttribute("error", "아이디와 비밀번호를 확인해 주세요");
			 return "redirect:/";
		 }else {
		 session.setAttribute("login", login); return "redirect: /main/home";
		 }
	 }
	 
	
	@GetMapping("/logout")
	public String out(HttpSession session) {
		log.info("로그 아웃을 시도합니다. ");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/main/home")
	public void home(HttpSession session, Model model) {
		log.info("메인 페이지로 이동합니다.");
		
		Criteria cri = new Criteria();
		cri.setAmount(5);
		
		List<BoardVO> list = b_service.list(cri); 
		int total = b_service.total(cri); 
		
		model.addAttribute("list", list);
		model.addAttribute("pageVO",new PageVO(cri, total)); 
		
	}
	
	@GetMapping("/self/profile")
	public void profile() {
		log.info("프로필 페이지로 이동합니다.");
		
	}
}
