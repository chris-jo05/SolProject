package com.spring.anonymous.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.anonymous.domain.AnonymousReplyVO;
import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.domain.Criteria;
import com.spring.anonymous.domain.PageVO;
import com.spring.anonymous.service.AnonymousReplyService;
import com.spring.anonymous.service.AnonymousService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/anonymous/*")
public class AnonymousController {
	
	@Autowired
	private AnonymousService service;

	@Autowired
	private AnonymousReplyService replyservice;
	
	@GetMapping("/anonymousMain")
	public void main(Model model, Criteria cri) {
		log.info("익명게시판 페이지 이동쓰");
	
	if(cri.getKeyword() == null) {
		List<AnonymousVO> list = service.list(cri);
		int total = service.total(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new PageVO(cri, total));
	} else {
		List<AnonymousVO> list = service.list(cri);
		int total = service.totalAsr(cri);
		log.info("토탈 : " + total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new PageVO(cri,total));
	
		}
	}
	
	@GetMapping("/newAnonymous")
	public void insert() {
		log.info("익명글 작성페이지 이동쓰");
	}
	
	@PostMapping("/newAnonymous")
	public String insertPost(AnonymousVO vo) {
		log.info("익명글 등록 요청" + vo); 
		
		if (service.insert(vo)) {
			return "redirect:anonymousMain";
		} else {
			return "redirect:newAnonymous";
		}
	}
	
	@GetMapping("/readAnonymous")
	public void read(int ano, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(ano+"번 글 읽어오기"+"cri:"+cri);
		
		AnonymousVO vo = service.read(ano);
		List<AnonymousReplyVO> replylist = replyservice.replylist(ano); 
		model.addAttribute("vo", vo);
		model.addAttribute("replylist", replylist);
	}
	
	@GetMapping("/modifyAnonymous")
	public void modifyGet(int ano, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(ano+"modify 폼 요청");
		
		AnonymousVO vo = service.read(ano);
		
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/modifyAnonymous")
	public String updatePost(AnonymousVO vo, Criteria cri, RedirectAttributes rttr) {
		if(service.update(vo)) {
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			return "redirect:readAnonymous?ano="+vo.getAno();
	} 	else {
			return "redirect:modifyAnonymous";
	}
  }
	@ResponseBody
	@PostMapping("/insertReply/{ano}")
	public int anonymousReplyInsert(@PathVariable("ano") int ano, AnonymousReplyVO reply) {
		reply.setAno(ano);
		return replyservice.replyinsert(reply)? 1:0;
	}
	
	@ResponseBody
	@PostMapping("/deleteReply")
	public int anonymousReplyDelete(String rpassword, int reno) {
		log.info("비밀번호 확인" +rpassword + reno + ",   " + replyservice.replyCheckPw(reno));
		if(rpassword.equals(replyservice.replyCheckPw(reno))) {
			return replyservice.replydelete(reno) ? 1:0;
		} else {
			return 0;
		}
	}
}
