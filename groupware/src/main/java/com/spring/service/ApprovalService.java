package com.spring.service;

import java.util.List;

import com.spring.domain.ApprovalVO;

public interface ApprovalService {
	public List<ApprovalVO> approvalList(int eno);
	public ApprovalVO readApproval(int docNo);
}