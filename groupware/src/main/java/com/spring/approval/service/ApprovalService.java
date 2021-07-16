package com.spring.approval.service;

import java.util.List;

import com.spring.approval.domain.ApprovalVO;

public interface ApprovalService {
	public List<ApprovalVO> approvalList(int eno);

	public ApprovalVO approvalRead(String docNo, int eno);
	
	public int approvalWrite(ApprovalVO approvalWrite);
}