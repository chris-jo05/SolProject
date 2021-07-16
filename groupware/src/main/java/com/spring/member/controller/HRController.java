package com.spring.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.member.domain.Criteria;
import com.spring.member.domain.MemberVo;
import com.spring.member.domain.PageVO;
import com.spring.member.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/hrteam/*")
public class HRController {

	@Autowired
	private MemberService service;

	@GetMapping("/hrMain")
	public void main(Model model, HttpSession session, Criteria cri) throws Exception {
		log.info("인사 관리 페이지로 이동합니다."+cri);

		List<MemberVo> list = service.list(cri);
		int total = service.total(cri);
		model.addAttribute("list", list);
		
		model.addAttribute("pageVO",new PageVO(cri, total));
		
	}

	@GetMapping("/hrNewMember")
	public void newMember() {
		log.info("사원 추가 페이지로 이동합니다.");
	}

	@PostMapping("/hrNewMember")
	public String memberInsert(MemberVo vo) {
		log.info("사원 삽입 요청" + vo);

		if (service.insert(vo)) {
			return "redirect:hrMain";
		} else {
			return "redirect:hrNewMember";
		}
	}

	
	  @GetMapping("/hrUpdateMember") 
	  public void updateMember(HttpServletRequest req, Model model) {
	  log.info("사원 수정 페이지로 이동합니다.");
	  	int eno = Integer.parseInt(req.getParameter("eno"));
	  	log.info("번호 보여줘"+eno);
	 
		MemberVo vo = service.selectMember(eno);
		String date = vo.getHireDate().split(" ")[0];
		vo.setHireDate(date);
		model.addAttribute("member", vo);
	  }
	 

	@PostMapping("/hrUpdateMember")
	public String memberUpdate(MemberVo vo) {
		log.info("사원 수정 요청" + vo);
		System.out.println(vo);

		if (service.update(vo)) {
			return "redirect:hrMain";
		} else {
			return "redirect:hrUpdateMember";
		}
	}

	@GetMapping("/hrSelectMember")
	@ResponseBody
	public MemberVo selectMember(int eno, Model model) {

		MemberVo vo = service.selectMember(eno);

		return vo;
	}
}
