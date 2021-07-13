package com.spring.mapper;

import java.util.List;

import com.spring.domain.ApprovalVO;

public interface ApprovalMapper {
	public List<ApprovalVO> approvalList(String docNo);
	public ApprovalVO readApproval(int docNo);
}