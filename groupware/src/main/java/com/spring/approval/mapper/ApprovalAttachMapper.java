package com.spring.approval.mapper;

import java.util.List;

import com.spring.approval.domain.ApprovalAttachVO;

public interface ApprovalAttachMapper {
	public List<ApprovalAttachVO> appAttachList(String docNo);
	public int appAttachInsert(ApprovalAttachVO appAttach);
}