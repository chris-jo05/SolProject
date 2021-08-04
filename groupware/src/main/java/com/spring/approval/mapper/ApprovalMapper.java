package com.spring.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;

public interface ApprovalMapper {
	public List<ApprovalVO> appList(int eno);
	public List<ApprovalVO> appListRec(int eno);
	public List<ApprovalVO> appListImp(int eno);
	public List<ApprovalVO> appListRet(int eno);
	public List<ApprovalVO> appListRef(int eno);
	
	public ApprovalVO appRead(@Param("docNo") String docNo, @Param("eno") int eno);
	public ApprovalVO appReadRec(@Param("docNo") String docNo, @Param("eno") int eno);
	public ApprovalVO appReadImp(@Param("docNo") String docNo, @Param("eno") int eno);
	public ApprovalVO appReadRet(@Param("docNo") String docNo, @Param("eno") int eno);
	public ApprovalVO appReadRef(@Param("docNo") String docNo, @Param("eno") int eno);
	
	public int appWrite1(ApprovalVO appWrite1);
	public int appWrite2(ApprovalVO appWrite2);
	
	// 파일 첨부
	public List<ApprovalAttachVO> appAttachList(String docNo);
	public int getCntUnRead(String docNo);
	
	// 결재선
	public int applineInsert(@Param("docNo") String docNo, @Param("eno") int eno, @Param("category") String category);
	public int getEno(String ename);
}