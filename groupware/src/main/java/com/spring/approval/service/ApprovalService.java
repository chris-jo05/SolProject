package com.spring.approval.service;

import java.util.List;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;

public interface ApprovalService {
	public List<ApprovalVO> appList(int eno);
	public ApprovalVO appRead(String docNo, int eno);
	public int appWrite1(ApprovalVO appWrite1);
	public int appWrite2(ApprovalVO appWrite2);

	// 파일 첨부
	public List<ApprovalAttachVO> appAttachList(String docNo);
	public int getCntUnRead(String docNo);
}