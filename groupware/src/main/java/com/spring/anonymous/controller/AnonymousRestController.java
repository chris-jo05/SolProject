package com.spring.anonymous.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.service.AnonymousReplyService;
import com.spring.anonymous.service.AnonymousService;
import com.spring.calendar.controller.CalRestController;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/anonymous/*")
public class AnonymousRestController {
	
	@Autowired
	private AnonymousService service;
	
	@PostMapping("/checkpw/{ano}")
	public ResponseEntity<String> checkpw(@PathVariable("ano") int ano) {
		
		String password = service.checkpw(ano);
		
		return new ResponseEntity<String>(password, HttpStatus.OK);
	}
	
	@DeleteMapping("/anonyDelete/{ano}")
	public ResponseEntity<String> delete(@PathVariable("ano") int ano) {
		log.info("게시물 삭제" + ano);
		
		return service.delete(ano) ? new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String> ("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

