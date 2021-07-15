package com.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/paystub/*")
public class payStubController {

	@GetMapping("/paystubList")
	public void stubpayList() {
		log.info("급여명세서 리스트 요청");
	}
	
	@GetMapping("/paystubForm")
	public void stubpayForm() {
		log.info("월별 급여명세서 요청");
	}
}
