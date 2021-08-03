package com.spring.teamView.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.PageVO;
import com.spring.member.domain.MemberVo;
import com.spring.teamView.domain.TeamCriteria;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;
import com.spring.teamView.domain.TeamPageVo;
import com.spring.teamView.service.TeamService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/teamview/*")
public class TeamViewController {
	
	@Autowired
	private TeamService service;
	
	@GetMapping("/teamViewMain")
	public void teamMain(TeamCriteria cri ,HttpSession session,Model model) {
		log.info("조직도 페이지로 이동합니다" + cri);
		
		List<TeamNameVo> teamList = service.teamList(cri);
		int total = service.totalTeam();
		log.info(total + "개의 부서가 존재합니다.");
		
		session.setAttribute("teamList", teamList);
		model.addAttribute("pageVo", new TeamPageVo(cri, total));
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
	public void hrTeam(TeamCriteria cri, int dno,Model model) {
		log.info("부서별 페이지로 이동합니다" + cri + dno);
		
		List<TeamMemberVo> member = service.showTeamList(cri, dno);
		log.info("각 사원들의 정보를 불러옵니다." + member);
		
		int total = service.totalTeamCount(dno);
		log.info(total + "명의 사원을 불러옵니다.");
		
		model.addAttribute("member", member);
		model.addAttribute("pageVo", new TeamPageVo(cri, total));
	}
	
	// 결재선 부서 가져오기
	@ResponseBody
	@GetMapping("/appLineDept")
	public List<TeamNameVo> appLineDept() {
		List<TeamNameVo> appLineDept = service.appLineDept();
		log.info("부서명 가져오기 " + appLineDept);
		
		return appLineDept;
	}
  
	
	// 결재선 부서인원 가져오기
	@ResponseBody
	@GetMapping("/appLineMember")
	public List<TeamMemberVo> appLineMember(int dno) {
	 	List<TeamMemberVo> appLineMember = service.appLineMember(dno);
	  	log.info("부서인원 가져오기 " + appLineMember);
	  	
	  	return appLineMember;
	}
	  
	// 선택된 부서인원 가져오기
	@ResponseBody
	@GetMapping("/appSelectedMember")
	public List<TeamMemberVo> appSelectedMember(int eno) {
	  	List<TeamMemberVo> appSelectedMember = service.appSelectedMember(eno);
	  	log.info("부서인원 가져오기 " + appSelectedMember);
	  	
	  	return appSelectedMember;
	}
	
	@GetMapping("/member_profile")
	public void member_profile(int eno, Model model) {
		MemberVo vo = service.member(eno);
		
		model.addAttribute("member", vo);
	}
}

