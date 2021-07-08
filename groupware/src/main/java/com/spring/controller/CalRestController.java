package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.CalendarVO;
import com.spring.service.CalendarService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/calendar/*")
public class CalRestController {
	
	@Autowired
	public CalendarService service;
	
	@GetMapping("/rest_list")
	public ResponseEntity<List<CalendarVO>> ListGet() {
		log.info("일정 정보 가져오기");
		
		return new ResponseEntity<List<CalendarVO>>(service.getList(),HttpStatus.OK);
	}
}
