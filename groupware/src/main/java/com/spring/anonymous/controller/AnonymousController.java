package com.spring.anonymous.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.service.AnonymousService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/anonymous/*")
public class AnonymousController {
	
	@Autowired
	private AnonymousService service;

	
	@GetMapping("/anonymousMain")
	public void main(Model model) {
		log.info("익명게시판 페이지 이동쓰");
		
	List<AnonymousVO> list = service.list();
	model.addAttribute("list", list);
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
	public void read(int ano, Model model) {
		log.info(ano+"번 글 읽어오기");
		
		AnonymousVO vo = service.read(ano);
		
		model.addAttribute("vo", vo);
	}
	
	@GetMapping("/modifyAnonymous")
	public void modifyGet(int ano, Model model) {
		log.info(ano+"modify 폼 요청");
		
		AnonymousVO vo = service.read(ano);
		
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/modifyAnonymous")
	public String updatePost(AnonymousVO vo) {
		if(service.update(vo)) {
			return "redirect:anonymousMain";
	} 	else {
			return "redirect:modifyAnonymous";
	}
  }
}
