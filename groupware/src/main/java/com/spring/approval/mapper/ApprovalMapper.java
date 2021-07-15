package com.spring.approval.mapper;

import java.util.List;

import com.spring.approval.domain.ApprovalVO;

public interface ApprovalMapper {
	public List<ApprovalVO> approvalList(int eno);

	public ApprovalVO approvalRead(String docNo);
	
	public int approvalWrite(ApprovalVO VO);
}