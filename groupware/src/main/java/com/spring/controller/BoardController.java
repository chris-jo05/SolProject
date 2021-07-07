package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardController {

	@GetMapping("/boardMain")
	public void main() {
		log.info("공지사항 페이지로 이동합니다.");
	}
	
	@GetMapping("/boardRead")
	public void read() {
		log.info("번의 공지사항을 읽습니다");
	}
}
