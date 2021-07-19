package com.spring.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;

public interface ApprovalMapper {
	public List<ApprovalVO> appList(int eno);
	public ApprovalVO appRead(@Param("docNo") String docNo, @Param("eno") int eno);
	public int appWrite1(ApprovalVO appWrite1);
	public int appWrite2(ApprovalVO appWrite2);
	
	// 파일 첨부
	public List<ApprovalAttachVO> appAttachList(String docNo);
	public int getCntUnRead(String docNo);
}