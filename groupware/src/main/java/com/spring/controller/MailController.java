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
		log.info("메일 메인 페이지로 이동" );
		
	}
	
	@GetMapping("/sendMail")
	public void sendBox() {
		log.info("보낸 메일함으로 이동");
	}
	
	@GetMapping("/mailWrite")
	public void write() {
		log.info("메일 작성 페이지로 이동" );
		
	}
	
	@GetMapping("/trashBean")
	public void trash() {
		log.info("휴지통으로 이동");
	}
	
	@GetMapping("/readMail")
	public void read() {
		log.info("메일 읽기 페이지로 이동");
	}
}
