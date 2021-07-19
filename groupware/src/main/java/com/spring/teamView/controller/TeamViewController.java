package com.spring.teamView.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;
import com.spring.teamView.service.TeamService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/teamview/*")
public class TeamViewController {
	
	@Autowired
	private TeamService service;
	
	@GetMapping("/teamViewMain")
	public void teamMain(HttpSession session) {
		log.info("조직도 페이지로 이동합니다");
		
		List<TeamNameVo> teamList = service.teamList();
		session.setAttribute("teamList", teamList);
	}
	
	@PostMapping("/newTeam")
	public String newTeam(String dname, String dphone) {
		log.info("새 부서를 생성합니다." + dname + dphone);
		
		if(service.newTeam(dname, dphone)>0) {
			return "redirect: teamViewMain";
		}else {
			return "redirect: teamViewMain";
		}
		
	}
	
	@GetMapping("/teamViewHr")
	public void hrTeam(int dno,Model model) {
		log.info("인사팀 페이지로 이동합니다");
		
		List<TeamMemberVo> member = service.showTeamList(dno);
		model.addAttribute("member", member);
	}
}
