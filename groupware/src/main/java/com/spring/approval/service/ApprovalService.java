package com.spring.approval.service;

import java.util.List;

import com.spring.approval.domain.ApprovalVO;

public interface ApprovalService {
	public List<ApprovalVO> appList(int eno);

	public ApprovalVO appRead(String docNo, int eno);

	public ApprovalVO appReadPeriod(String docNo, String docKind, int eno);

	public int appWrite(ApprovalVO appWrite);
}