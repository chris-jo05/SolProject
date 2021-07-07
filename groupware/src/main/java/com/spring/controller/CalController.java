package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/calendar/*")
public class CalController {

	@GetMapping("/calendar")
	public void main() {
		
		log.info("일정 페이지로 이동합니다.");
	}
}
