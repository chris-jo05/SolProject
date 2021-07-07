package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/work/*")
public class WorkController {

	
	@GetMapping("/workTable")
	public void work() {
		log.info("근무 관리 페이지로 이동합니다.");
	}
}
