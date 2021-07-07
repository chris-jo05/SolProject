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
		log.info("메일함 페이지로 이동합니다." );
		
	}
	
	@GetMapping("/sendMail")
	public void sendBox() {
		log.info("메일 보내기 페이지로 이동합니다.");
	}
	
	@GetMapping("/mailWrite")
	public void write() {
		log.info("메일 쓰기 페이지로 이동합니다." );
		
	}
	
	@GetMapping("/trashBean")
	public void trash() {
		log.info("휴지동 페이지로 이동합니다.");
	}
	
	@GetMapping("/readMail")
	public void read() {
		log.info("메읽 읽기 페이지로 이동합니다.");
	}
}
