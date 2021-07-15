package com.spring.mail.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageVO;
import com.spring.mail.domain.FileAttachVo;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;
import com.spring.mail.service.MailBoardService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/mailbox/*")
public class MailController {
	
	@Autowired
	private MailBoardService service;
	
	@GetMapping("/mailMain")
	public void Main(Criteria cri, HttpSession session,Model model) {
		log.info("메일함 페이지로 이동합니다." + cri);
		
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		List<MailBoardVo> mailList = service.mailList(cri, member.getId());
		int total = service.totalCnt(member.getId());
		
		model.addAttribute("mailList", mailList);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	@GetMapping("/sendMailBox")
	public void sendList(Criteria cri, HttpSession session,Model model) {
		log.info("보낸 메일함 페이지로 이동합니다.");
		
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		List<MailBoardVo> sendList = service.sendMailBox(cri, member.getId());
		int total = service.sendTotalCnt(member.getId());
		
		model.addAttribute("sendList", sendList);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	
	@GetMapping("/mailWrite")
	public void write() {
		log.info("메일 쓰기 페이지로 이동합니다." );
		
	}
	
	@PostMapping("/mailWrite")
	public String writeMail(MailBoardVo write, RedirectAttributes rttr) {
		log.info("메일을 보냅니다" + write);
		
		// 첨부파일 확인하기
		if(write.getAttachList() != null) {
			write.getAttachList().forEach(attach -> log.info("" + attach));
		}
		
		int result = service.writeMail(write);
		
		if(result > 0) {
			rttr.addFlashAttribute("result", write.getM_no());
			return "redirect: mailMain";
		}else {
			return "redirect: mailWriter";
		}
	}
	
	@GetMapping("/trashBean")
	public void trash(Criteria cri, HttpSession session,Model model) {
		log.info("휴지동 페이지로 이동합니다.");
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		List<MailBoardVo> beanList = service.beanListMail(cri, member.getId());
		int total = service.totalBeanCnt(member.getId());
		
		model.addAttribute("beanList", beanList);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	
	@GetMapping("/readMail")
	public void read(int m_no,HttpSession session,Model model) {
		log.info("메읽 읽기 페이지로 이동합니다." + m_no);
		
		MemberVo member=(MemberVo)session.getAttribute("login");
		log.info(member.getId());
		MailBoardVo read = service.readMail(m_no,member.getId());
		log.info(read.getE_id());
		
		session.setAttribute("read", read);
	}
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<FileAttachVo>> getAttachList(int m_no){
		log.info("첨부 파일 가져오기 " + m_no);
		
		return new ResponseEntity<List<FileAttachVo>>(service.getAttachList(m_no),HttpStatus.OK);
	}
	
	@PostMapping("/removeMailList")
	public String removeMailList(MailRemoveVo removeMail) {
		log.info("메일을 휴지통에 넣습니다." + removeMail);
		
		service.deleteMailList(removeMail);
		return "redirect: mailMain";
	}
	
	@PostMapping("/removeMail")
	public String removeMail(int m_no) {
		log.info("메일을 휴지통에 넣습니다.");
		service.deleteMail(m_no);
		return "redirect: mailMain";
	}
	
}
