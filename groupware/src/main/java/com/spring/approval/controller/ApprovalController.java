package com.spring.approval.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.domain.DoclineVO;
import com.spring.approval.service.ApprovalService;
import com.spring.member.domain.MemberVo;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService service;

	@GetMapping("/appMain")
	public void main(HttpSession session, Model model) {
		log.info("전자결재 메인 페이지로 이동");

		MemberVo member = (MemberVo) session.getAttribute("login");
		log.info(member.getEno());
		List<ApprovalVO> appList = service.appList(member.getEno());
		log.info(appList);

		model.addAttribute("appList", appList);
	}

	@GetMapping("/appRead")
	public void read(String docNo, HttpSession session, Model model) {
		log.info("결재문서 읽기로 이동" + docNo);

		MemberVo member = (MemberVo) session.getAttribute("login");
		log.info(member.getEno());
		ApprovalVO appRead = service.appRead(docNo, member.getEno());
		log.info(appRead.getEno());
		
		List<DoclineVO> dls = service.getDoclines(docNo);
		log.info(dls);
		
		model.addAttribute("appRead", appRead);
		model.addAttribute("dls", dls);
	}

	@GetMapping("/appLine")
	public void line(Model model) {
		log.info("결재선으로 이동");
	}

	@GetMapping("/appWriteDraft")
	public void drift() {
		log.info("기안서로 이동");
	}

	@PostMapping("/appWriteDraft")
	public String writeDraft(ApprovalVO appWrite1, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite1.getSign_ename1());
		
		log.info("기안서 상신" + appWrite1);
		log.info("결재 직급 1 : " + appWrite1.getSign_position1() + ", 결재 사원명 1 : " + appWrite1.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite1.getSign_position2() + ", 결재 사원명 2 : " + appWrite1.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite1.getSign_position3() + ", 결재 사원명 3 : " + appWrite1.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite1.getSign_position4() + ", 결재 사원명 4 : " + appWrite1.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite1.getCon_position1() + ", 합의 사원명 1 : " + appWrite1.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite1.getCon_position2() + ", 합의 사원명 2 : " + appWrite1.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite1.getCon_position3() + ", 합의 사원명 3 : " + appWrite1.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite1.getCon_position4() + ", 합의 사원명 4 : " + appWrite1.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite1.getAppAttachList() != null) {
			appWrite1.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite1(appWrite1);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite1.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite1.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite1.getSign_position1().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position2().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position3().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position4().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite1.getCon_position1().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position2().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position3().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position4().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite1.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteDraft";
		}
	}

	@GetMapping("/appWriteReport")
	public void report() {
		log.info("보고서로 이동");
	}

	@PostMapping("/appWriteReport")
	public String WriteReport(ApprovalVO appWrite1, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite1.getSign_ename1());
		
		log.info("기안서 상신" + appWrite1);
		log.info("결재 직급 1 : " + appWrite1.getSign_position1() + ", 결재 사원명 1 : " + appWrite1.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite1.getSign_position2() + ", 결재 사원명 2 : " + appWrite1.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite1.getSign_position3() + ", 결재 사원명 3 : " + appWrite1.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite1.getSign_position4() + ", 결재 사원명 4 : " + appWrite1.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite1.getCon_position1() + ", 합의 사원명 1 : " + appWrite1.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite1.getCon_position2() + ", 합의 사원명 2 : " + appWrite1.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite1.getCon_position3() + ", 합의 사원명 3 : " + appWrite1.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite1.getCon_position4() + ", 합의 사원명 4 : " + appWrite1.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite1.getAppAttachList() != null) {
			appWrite1.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite1(appWrite1);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite1.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite1.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite1.getSign_position1().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position2().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position3().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position4().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite1.getCon_position1().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position2().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position3().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position4().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite1.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteReport";
		}
	}

	@GetMapping("/appWriteResignation")
	public void resignation() {
		log.info("사직서로 이동");
	}

	@PostMapping("/appWriteResignation")
	public String Writeresignation(ApprovalVO appWrite1, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite1.getSign_ename1());
		
		log.info("기안서 상신" + appWrite1);
		log.info("결재 직급 1 : " + appWrite1.getSign_position1() + ", 결재 사원명 1 : " + appWrite1.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite1.getSign_position2() + ", 결재 사원명 2 : " + appWrite1.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite1.getSign_position3() + ", 결재 사원명 3 : " + appWrite1.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite1.getSign_position4() + ", 결재 사원명 4 : " + appWrite1.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite1.getCon_position1() + ", 합의 사원명 1 : " + appWrite1.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite1.getCon_position2() + ", 합의 사원명 2 : " + appWrite1.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite1.getCon_position3() + ", 합의 사원명 3 : " + appWrite1.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite1.getCon_position4() + ", 합의 사원명 4 : " + appWrite1.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite1.getAppAttachList() != null) {
			appWrite1.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite1(appWrite1);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite1.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite1.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite1.getSign_position1().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position2().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position3().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position4().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite1.getCon_position1().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position2().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position3().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position4().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite1.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteResignation";
		}
	}

	@GetMapping("/appWriteExpenseStatement")
	public void expensestatement() {
		log.info("지출내역서로 이동");
	}

	@PostMapping("/appWriteExpenseStatement")
	public String WriteExpenseStatement(ApprovalVO appWrite1, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite1.getSign_ename1());
		
		log.info("기안서 상신" + appWrite1);
		log.info("결재 직급 1 : " + appWrite1.getSign_position1() + ", 결재 사원명 1 : " + appWrite1.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite1.getSign_position2() + ", 결재 사원명 2 : " + appWrite1.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite1.getSign_position3() + ", 결재 사원명 3 : " + appWrite1.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite1.getSign_position4() + ", 결재 사원명 4 : " + appWrite1.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite1.getCon_position1() + ", 합의 사원명 1 : " + appWrite1.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite1.getCon_position2() + ", 합의 사원명 2 : " + appWrite1.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite1.getCon_position3() + ", 합의 사원명 3 : " + appWrite1.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite1.getCon_position4() + ", 합의 사원명 4 : " + appWrite1.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite1.getAppAttachList() != null) {
			appWrite1.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite1(appWrite1);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite1.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite1.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite1.getSign_position1().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position2().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position3().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite1.getSign_position4().equals("")) {
			eno = service.getEno(appWrite1.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite1.getCon_position1().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position2().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position3().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite1.getCon_position4().equals("")) {
			eno = service.getEno(appWrite1.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite1.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteExpenseStatement";
		}
	}

	@GetMapping("/appWriteAnnualPlan")
	public void annualplan() {
		log.info("연차신청서로 이동");
	}

	@PostMapping("/appWriteAnnualPlan")
	public String WriteAnnualPlan(ApprovalVO appWrite2, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite2.getSign_ename1());
		
		log.info("기안서 상신" + appWrite2);
		log.info("결재 직급 1 : " + appWrite2.getSign_position1() + ", 결재 사원명 1 : " + appWrite2.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite2.getSign_position2() + ", 결재 사원명 2 : " + appWrite2.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite2.getSign_position3() + ", 결재 사원명 3 : " + appWrite2.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite2.getSign_position4() + ", 결재 사원명 4 : " + appWrite2.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite2.getCon_position1() + ", 합의 사원명 1 : " + appWrite2.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite2.getCon_position2() + ", 합의 사원명 2 : " + appWrite2.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite2.getCon_position3() + ", 합의 사원명 3 : " + appWrite2.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite2.getCon_position4() + ", 합의 사원명 4 : " + appWrite2.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite2.getAppAttachList() != null) {
			appWrite2.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite2(appWrite2);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite2.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite2.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite2.getSign_position1().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position2().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position3().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position4().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite2.getCon_position1().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position2().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position3().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position4().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite2.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteAnnualPlan";
		}
	}

	@GetMapping("/appWriteBusinessTrip")
	public void businesstrip() {
		log.info("출장신청서로 이동");
	}

	@PostMapping("/appWriteBusinessTrip")
	public String WriteBusinessTrip(ApprovalVO appWrite2, RedirectAttributes rttr) {
		
		int eno = service.getEno(appWrite2.getSign_ename1());
		
		log.info("기안서 상신" + appWrite2);
		log.info("결재 직급 1 : " + appWrite2.getSign_position1() + ", 결재 사원명 1 : " + appWrite2.getSign_ename1() + ", 결재 사원번호 : " + eno);
		log.info("결재 직급 2 : " + appWrite2.getSign_position2() + ", 결재 사원명 2 : " + appWrite2.getSign_ename2());
		log.info("결재 직급 3 : " + appWrite2.getSign_position3() + ", 결재 사원명 3 : " + appWrite2.getSign_ename3());
		log.info("결재 직급 4 : " + appWrite2.getSign_position4() + ", 결재 사원명 4 : " + appWrite2.getSign_ename4());
		
		log.info("합의 직급 1 : " + appWrite2.getCon_position1() + ", 합의 사원명 1 : " + appWrite2.getCon_ename1());
		log.info("합의 직급 2 : " + appWrite2.getCon_position2() + ", 합의 사원명 2 : " + appWrite2.getCon_ename2());
		log.info("합의 직급 3 : " + appWrite2.getCon_position3() + ", 합의 사원명 3 : " + appWrite2.getCon_ename3());
		log.info("합의 직급 4 : " + appWrite2.getCon_position4() + ", 합의 사원명 4 : " + appWrite2.getCon_ename4());
		
		// 첨부파일 확인
		if (appWrite2.getAppAttachList() != null) {
			appWrite2.getAppAttachList().forEach(attach -> log.info("" + attach));
		}

		int result = service.appWrite2(appWrite2);
		
		Calendar cal = Calendar.getInstance();
		int month = (cal.get(Calendar.MONTH) + 1);
		String now = cal.get(Calendar.YEAR) + "" + ((month > 9) ? "" : "0") + month + "-" + appWrite2.getDoc_seq();
		log.info("문서 시퀀스 : " + appWrite2.getDoc_seq() + ", 문서번호 : " + now);
		
		if(!appWrite2.getSign_position1().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename1());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position2().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename2());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position3().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename3());
			
			service.applineInsert(now, eno, "결재");
		}
		if(!appWrite2.getSign_position4().equals("")) {
			eno = service.getEno(appWrite2.getSign_ename4());
			
			service.applineInsert(now, eno, "결재");
		}
		
		if(!appWrite2.getCon_position1().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename1());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position2().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename2());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position3().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename3());
			
			service.applineInsert(now, eno, "합의");
		}
		if(!appWrite2.getCon_position4().equals("")) {
			eno = service.getEno(appWrite2.getCon_ename4());
			
			service.applineInsert(now, eno, "합의");
		}
		
		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite2.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteBusinessTrip";
		}
	}

	@GetMapping("/appBoxReceive")
	public void boxreceive() {
		log.info("수신함으로 이동");
	}
	
	@GetMapping("/appBoxImplementation")
	public void boxrequest() {
		log.info("시행함 이동");
	}

	@GetMapping("/appBoxReturn")
	public void boxreturn() {
		log.info("반려함으로 이동");
	}

	@GetMapping("/appBoxReference")
	public void boxreference() {
		log.info("참조함으로 이동");
	}

	@GetMapping("/appAttachList")
	public ResponseEntity<List<ApprovalAttachVO>> appAttachList(String docNo) {
		log.info("첨부 파일 가져오기 " + docNo);

		return new ResponseEntity<List<ApprovalAttachVO>>(service.appAttachList(docNo), HttpStatus.OK);
	}

}