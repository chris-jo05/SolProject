package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.CalendarVO;
import com.spring.service.CalendarService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/calendar/*")
public class CalController {
	
	@Autowired
	private CalendarService service;
	
	@GetMapping("/calendar")
	public void main(int eno, Model model) {
		log.info("calender 페이지 요청");
	}
}
