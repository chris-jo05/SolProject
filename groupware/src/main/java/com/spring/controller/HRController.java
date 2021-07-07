package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/hrteam/*")
public class HRController {

	
	@GetMapping("/hrMain")
	public void main() {
		log.info("인사 관리 페이지로 이동합니다.");
	}
	
	@GetMapping("/hrNewMember")
	public void newMember() {
		log.info("사원 추가 페이지로 이동합니다.");
	}
	
	@GetMapping("/hrUpdateMember")
	public void updateMember() {
		log.info("사원 수정 페이지로 이동합니다.");
	}
}
