package com.spring.attendance.controller;

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

import com.spring.attendance.domain.AttendanceVO;
import com.spring.attendance.service.AttendanceService;
import com.spring.calendar.domain.CalendarRepEmpVO;
import com.spring.calendar.domain.CalendarVO;
import com.spring.calendar.service.CalendarService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/work/*")
public class AttendanceRestController {
	
	@Autowired
	public AttendanceService service;
	
	@PostMapping("/rest_check/{eno}/{workDay}")
	public ResponseEntity<List<AttendanceVO>> check(@PathVariable("eno") int eno,@PathVariable("workDay") String workDay) {
		log.info("출근 확인 ");
		
		List<AttendanceVO> list = service.check(eno, workDay);
		
		return list != null ? new ResponseEntity<List<AttendanceVO>>(list, HttpStatus.OK) :
				new ResponseEntity<List<AttendanceVO>>(list, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/rest_update/")
	public ResponseEntity<String> checkOut(@RequestBody AttendanceVO vo) {
		log.info("퇴근 시 업데이트 " + vo);
		
		return service.update(vo) ? new ResponseEntity<String>("success", HttpStatus.OK) :
			new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
