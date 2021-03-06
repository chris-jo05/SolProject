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
	public void work(Criteria cri, int eno, String year, String month, Model model) {
		log.info("근무 관리 페이지로 이동합니다.");
		
		String workDay = year + "-";
		workDay += Integer.parseInt(month) > 9 ? month : "0" + month;
		
		List<AttendanceVO> list = service.list(cri, eno, workDay);
		
		int total = service.totalCnt(eno, workDay);
		log.info("total : " + total);
		model.addAttribute("workList", list);
		model.addAttribute("pageVo", new PageVO(cri, total));
	}
	
	@PostMapping("/check")
	public String check(AttendanceVO vo) {
		log.info("출퇴근 확인 요청 " + vo);
		
		boolean result = true;
		String workDay = vo.getWorkDay();
		String year = workDay.split("-")[0];
		String month = workDay.split("-")[1]; 
		if(month.charAt(0) == '0') {
			month = Character.toString(month.charAt(1));
		}
		
		if(vo.getInout().equals("in")) {
			result = service.insert(vo);
		} else {
			log.info("out");
		}
			
		if(result) {
			return "redirect:workTable?eno=" + vo.getEno() + "&year=" + year + "&month=" + month;
		} else {
			return "redirect:/main/home";
		}
	}
}
