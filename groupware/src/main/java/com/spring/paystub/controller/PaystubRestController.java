package com.spring.paystub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.calendar.controller.CalRestController;
import com.spring.calendar.domain.CalendarVO;
import com.spring.paystub.domain.PaystubVO;
import com.spring.paystub.service.PaystubService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/paystub/*")
public class PaystubRestController {
	
	@Autowired
	public PaystubService service;
	
	@PostMapping("/rest_new")
	public ResponseEntity<String> insert(@RequestBody PaystubVO vo) {
		log.info("급여명세서 삽입 " + vo);
		
		return service.insert(vo) ? new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/rest_check/{eno}/{year}/{month}")
	public ResponseEntity<String> check(@PathVariable("eno") int eno,@PathVariable("year") int year,@PathVariable("month") int month) {
		log.info("급여명세서 발급 체크 : " + eno + "/" + year + "/" + month);
		
		String check = service.check(year, month, eno);
		
		return new ResponseEntity<String>(check, HttpStatus.OK);
	}
}
