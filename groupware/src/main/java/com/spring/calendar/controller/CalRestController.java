package com.spring.calendar.controller;

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

import com.spring.calendar.domain.CalendarRepEmpVO;
import com.spring.calendar.domain.CalendarVO;
import com.spring.calendar.service.CalendarService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/calendar/*")
public class CalRestController {
	
	@Autowired
	public CalendarService service;
	
	@GetMapping("/rest_list/{eno}" )
	public ResponseEntity<List<CalendarVO>> ListGet(@PathVariable("eno") int eno) {
		log.info("일정 정보 가져오기");
		
		return new ResponseEntity<List<CalendarVO>>(service.getList(eno),HttpStatus.OK);
	}
	
	@PostMapping("/rest_get/{cno}")
	public ResponseEntity<CalendarVO> get(@PathVariable("cno") int cno) {
		log.info("일정 정보 하나 가져오가" + cno);
		
		return new ResponseEntity<CalendarVO>(service.get(cno), HttpStatus.OK);
	}
	
	@PostMapping("/rest_new")
	public ResponseEntity<Integer> insert(@RequestBody CalendarVO vo) {
		log.info("일정 삽입 " + vo);
		
		return service.insert(vo) ? new ResponseEntity<Integer>(vo.getCno(),HttpStatus.OK) :
			new ResponseEntity<Integer>(vo.getCno(),HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/rest_group/{groupId}")
	public ResponseEntity<List<CalendarRepEmpVO>> getRepName(@PathVariable("groupId") String groupId) {
		log.info("일정 담당자 이름 가져오기" + groupId);
		
		return new ResponseEntity<List<CalendarRepEmpVO>>(service.getRepName(groupId),HttpStatus.OK);
	}
	
	@PostMapping("/rest_no/{ename}/{dname}")
	public ResponseEntity<CalendarRepEmpVO> getRepNo(CalendarRepEmpVO vo) {
		log.info("일정 담당자 사원번호, 부서번호 가져오기 " + vo.getEname() + ", " + vo.getDname());
		
		return new ResponseEntity<CalendarRepEmpVO>(service.getRepNo(vo),HttpStatus.OK);
	}

	@DeleteMapping("/rest_delete/{groupId}")
	public ResponseEntity<String> remove(@PathVariable("groupId") String groupId) {
		log.info("댓글 삭제" + groupId);
		
		return service.delete(groupId) ? new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/rest_dept")
	public ResponseEntity<List<String>> getDept() {
		log.info("전체 부서 이름 요청 ");
		
		return new ResponseEntity<List<String>>(service.dept_list(), HttpStatus.OK);
	}
	
	@PostMapping("/rest_emp/{dname}")
	public ResponseEntity<List<String>> getEmp(@PathVariable("dname") String dname) {
		log.info("해당 부서 전체 사원 이름 요청 ");
		
		return new ResponseEntity<List<String>>(service.emp_list(dname), HttpStatus.OK);
	}
	
	@PostMapping("/rest_check/{cno}/{cal_check}")
	public ResponseEntity<String> updateCheck(@PathVariable("cno") int cno, @PathVariable("cal_check") String cal_check) {
		log.info("일정 체크 변경 요청 " + cno + " " + cal_check);
		
		return service.updateCheck(cno, cal_check) ? new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/rest_group")
	public ResponseEntity<List<String>> groupIdCheck() {
		log.info("일정 그룹 이름 중복 검사 요청");
		
		return new ResponseEntity<List<String>>(service.groupIdCheck(),HttpStatus.OK);
	}
}
