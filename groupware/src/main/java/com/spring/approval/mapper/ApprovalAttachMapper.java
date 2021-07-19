package com.spring.approval.mapper;

import java.util.List;

import com.spring.approval.domain.ApprovalAttachVO;

public interface ApprovalAttachMapper {
	public int AppAttachInsert(ApprovalAttachVO attach);
	public List<ApprovalAttachVO> AppAttachRead(String docNo);
}