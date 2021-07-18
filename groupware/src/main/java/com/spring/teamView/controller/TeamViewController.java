package com.spring.teamView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/teamview/*")
public class TeamViewController {
	
	@GetMapping("/teamViewMain")
	public void teamMain() {
		log.info("조직도 페이지로 이동합니다");
	}
}
