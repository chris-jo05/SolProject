package com.spring.mail.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageVO;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;
import com.spring.mail.service.MailBoardService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/mailbox/*")
public class MailBeanController {
	
	@Autowired
	private MailBoardService service;
	
	@GetMapping("/trashBean")
	public void trash(Criteria cri, HttpSession session,Model model) {
		log.info("휴지동 페이지로 이동합니다.");
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		List<MailBoardVo> beanList = service.beanListMail(cri, member.getId());
		int total = service.totalBeanCnt(member.getId());
		
		model.addAttribute("beanList", beanList);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	@PostMapping("/removeBeanMailList")
	public String removeBeanMailList(MailRemoveVo removeMail) {
		log.info("휴지통의 체크된 메일을 지웁니다 " + removeMail);
		
		service.deleteBeanMailList(removeMail);
		return "redirect: trashBean";
	}
	
	@PostMapping("/removeBean")
	public String removeBean(int m_no) {
		log.info("휴지통에 읽은 메일을 지웁니다" +m_no);
		
		service.deleteBeanMail(m_no);
		
		return "redirect: trashBean";
	}
	
	@GetMapping("/readBeanMail")
	public void beanReadMail(int m_no,HttpSession session ,Model model) {
		log.info("휴지통에 있는 메일을 읽습니다." + m_no);
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		log.info(member.getId());
		MailBoardVo read = service.beanReadMail(m_no, member.getId());
		model.addAttribute("read", read);
	}
}
