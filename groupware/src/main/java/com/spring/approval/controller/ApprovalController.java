package com.spring.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.service.ApprovalService;
import com.spring.member.domain.MemberVo;

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

		model.addAttribute("appRead", appRead);
	}

	@GetMapping("/appWriteDraft")
	public void drift() {
		log.info("기안서로 이동");
	}

	@PostMapping("/appWriteDraft")
	public String writeDraft(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("기안서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
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
	public String WriteReport(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("보고서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
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
	public String Writeresignation(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("사직서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
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
	public String WriteExpenseStatement(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("지출내역서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
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
	public String WriteAnnualPlan(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("연차신청서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
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
	public String WriteBusinessTrip(ApprovalVO appWrite, RedirectAttributes rttr) {
		log.info("출장신청서 상신" + appWrite);

		int result = service.appWrite(appWrite);

		if (result > 0) {
			rttr.addFlashAttribute("result", appWrite.getDocNo());
			return "redirect: appMain";
		} else {
			return "redirect: appWriteBusinessTrip";
		}
	}

	@GetMapping("/appBoxReceive")
	public void boxreceive() {
		log.info("수신함으로 이동");
	}

	@GetMapping("/appBoxReturn")
	public void boxreturn() {
		log.info("반려함으로 이동");
	}

	@GetMapping("/appBoxReference")
	public void boxreference() {
		log.info("수신참조함으로 이동");
	}
}