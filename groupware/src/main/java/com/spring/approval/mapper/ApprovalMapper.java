package com.spring.approval.mapper;

import java.util.List;

import com.spring.approval.domain.ApprovalVO;

public interface ApprovalMapper {
	public List<ApprovalVO> appList(int eno);

	public ApprovalVO appRead(String docNo);

	public ApprovalVO appReadPeriod(String docNo, String docKind);

	public int appWrite(ApprovalVO appWrite);
}