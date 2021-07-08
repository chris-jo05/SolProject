package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MailBoardVo;
import com.spring.domain.MemberVo;
import com.spring.service.MailBoardService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/mailbox/*")
public class MailController {
	
	@Autowired
	private MailBoardService service;
	
	@GetMapping("/mailMain")
	public void Main(HttpSession session,Model model) {
		log.info("메일함 페이지로 이동합니다.");
		
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		List<MailBoardVo> mailList = service.mailList(member.getId());
		
		model.addAttribute("mailList", mailList);
		
	}
	
	@GetMapping("/sendMailBox")
	public void sendBox() {
		log.info("보낸 메일함 페이지로 이동합니다.");
	}
	
	
	@GetMapping({"/mailWrite","mailWriteAgain"})
	public void write() {
		log.info("메일 쓰기 페이지로 이동합니다." );
		
	}
	
	@PostMapping({"/mailWrite","mailWriteAgain"})
	public String writeMail(MailBoardVo write) {
		log.info("메일을 보냅니다");
		
		int result = service.writeMail(write);
		
		if(result > 0) {
			return "redirect: mailMain";
		}else {
			return "redirect: mailwriter";
		}
	}
	
	@GetMapping("/trashBean")
	public void trash() {
		log.info("휴지동 페이지로 이동합니다.");
	}
	
	@GetMapping("/readMail")
	public void read(int m_no,HttpSession session,Model model) {
		log.info("메읽 읽기 페이지로 이동합니다." + m_no);
		
		MailBoardVo read = service.readMail(m_no);
		
		session.setAttribute("read", read);
	}
}
