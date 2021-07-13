package com.spring.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@GetMapping("/appMain")
	public void main() {
		log.info("전자결재 메인 페이지로 이동");
	}

	@GetMapping("/appWriteDraft")
	public void drift() {
		log.info("기안서로 이동");
	}

	@GetMapping("/appWriteReport")
	public void report() {
		log.info("보고서로 이동");
	}
	
	@GetMapping("/appWriteResignation")
	public void resignation() {
		log.info("사직서로 이동");
	}

	@GetMapping("/appWriteExpenseStatement")
	public void expensestatement() {
		log.info("지출내역서로 이동");
	}

	@GetMapping("/appWriteAnnualPlan")
	public void annualplan() {
		log.info("연차신청서로 이동");
	}
	
	@GetMapping("/appWriteBusinessTrip")
	public void businesstrip() {
		log.info("출장신청서로 이동");
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