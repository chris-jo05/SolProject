package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.MemberVo;
import com.spring.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/hrteam/*")
public class HRController {

	@Autowired
	private MemberService service;
	
	
	@GetMapping("/hrMain")
	public void main(Model model) {
		log.info("인사 관리 페이지로 이동합니다.");
		
		List<MemberVo> list = service.list();
		model.addAttribute("list",list);
		
	}
	
	/*
	 * @GetMapping("/list") public void list() { log.info("사원 리스트 요청"); }
	 */
	
	@GetMapping("/hrNewMember")
	public void newMember() {
		log.info("사원 추가 페이지로 이동합니다.");
	}
	
	@PostMapping("/hrNewMember")
	public String memberInsert(MemberVo vo) {
		log.info("사원 삽입 요청"+vo);
		
		if (service.insert(vo)) {
			return "redirect:hrMain";
		}else {
			return "redirect:hrNewMember";
		}
	}
	
	@GetMapping("/hrUpdateMember")
	public void updateMember() {
		log.info("사원 수정 페이지로 이동합니다.");
	}
}
