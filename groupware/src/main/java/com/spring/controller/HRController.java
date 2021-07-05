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
		log.info("�λ� ���� �������� �̵�");
	}
	
	@GetMapping("/hrNewMember")
	public void newMember() {
		log.info("��� �߰� �������� �̵�");
	}
	
	@GetMapping("/hrUpdateMember")
	public void updateMember() {
		log.info("��� ���� �������� �̵�");
	}
}
