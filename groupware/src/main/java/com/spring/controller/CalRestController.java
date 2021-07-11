package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.CalendarRepEmpVO;
import com.spring.domain.CalendarVO;
import com.spring.domain.MemberVo;
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
	
	@PostMapping("/rest_get/{cno}")
	public ResponseEntity<CalendarVO> get(@PathVariable("cno") int cno) {
		log.info("일정 정보 하나 가져오가" + cno);
		
		return new ResponseEntity<CalendarVO>(service.get(cno), HttpStatus.OK);
	}
	
	@PostMapping("/rest_new")
	public ResponseEntity<Integer> insert(@RequestBody CalendarVO vo) {
		log.info("일정 삽입 " + vo);
		
		return service.insert(vo) ? new ResponseEntity<Integer>((vo.getCno()+1),HttpStatus.OK) :
			new ResponseEntity<Integer>((vo.getCno()+1),HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/rest_ename/{title}")
	public ResponseEntity<List<CalendarRepEmpVO>> getRepName(@PathVariable("title") String title) {
		log.info("일정 담당자 이름 가져오기" + title);
		
		return new ResponseEntity<List<CalendarRepEmpVO>>(service.getRepName(title),HttpStatus.OK);
	}
	
	@PostMapping("/rest_no/{ename}/{dname}")
	public ResponseEntity<CalendarRepEmpVO> getRepNo(CalendarRepEmpVO vo) {
		log.info("일정 담당자 사원번호, 부서번호 가져오기 " + vo.getEname() + ", " + vo.getDname());
		
		return new ResponseEntity<CalendarRepEmpVO>(service.getRepNo(vo),HttpStatus.OK);
	}
	
	@DeleteMapping("/rest_delete/{cno}")
	public ResponseEntity<String> remove(@PathVariable("cno") int cno) {
		log.info("댓글 삭제" + cno);
		
		return service.delete(cno) ? new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
