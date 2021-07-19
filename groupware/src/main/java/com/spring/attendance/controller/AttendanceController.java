package com.spring.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.attendance.domain.AttendanceVO;
import com.spring.attendance.service.AttendanceService;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageVO;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/work/*")
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("/workTable")
	public void work(Criteria cri, int eno, Model model) {
		log.info("근무 관리 페이지로 이동합니다.");
		
		//MemberVo member=(MemberVo)session.getAttribute("login");
		List<AttendanceVO> list = service.list(cri, eno);
		
		int total = service.totalCnt(eno);
		
		model.addAttribute("workList", list);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	@PostMapping("/check")
	public String check(AttendanceVO vo) {
		log.info("출퇴근 확인 요청 " + vo);
		
		boolean result = true;
		
		if(vo.getInout().equals("in")) {
			result = service.insert(vo);
		} else {
			log.info("out");
		}
			
		if(result) {
			return "redirect:workTable?eno=" + vo.getEno();
		} else {
			return "redirect:/main/home";
		}
	}
}
