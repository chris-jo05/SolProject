package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/mailbox/*")
public class MailController {
	
	
	@GetMapping("/mailMain")
	public void Main() {
		log.info("���� ���� �������� �̵�" );
		
	}
	
	@GetMapping("/sendMail")
	public void sendBox() {
		log.info("���� ���������� �̵�");
	}
	
	@GetMapping("/mailWrite")
	public void write() {
		log.info("���� �ۼ� �������� �̵�" );
		
	}
	
	@GetMapping("/trashBean")
	public void trash() {
		log.info("���������� �̵�");
	}
	
	@GetMapping("/readMail")
	public void read() {
		log.info("���� �б� �������� �̵�");
	}
}
