package com.spring.approval.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.domain.DoclineVO;

public interface ApprovalService {
	public List<ApprovalVO> appList(int eno);
	public List<ApprovalVO> appListRec(int eno);
	public List<ApprovalVO> appListImp(int eno);
	public List<ApprovalVO> appListRet(int eno);
	public List<ApprovalVO> appListRef(int eno);

	public ApprovalVO appRead(String docNo, int eno);
	public ApprovalVO appReadRec(String docNo, int eno);
	public ApprovalVO appReadImp(String docNo, int eno);
	public ApprovalVO appReadRet(String docNo, int eno);
	public ApprovalVO appReadRef(String docNo, int eno);
	
	public int appWrite1(ApprovalVO appWrite1);
	public int appWrite2(ApprovalVO appWrite2);

	// 파일 첨부
	public List<ApprovalAttachVO> appAttachList(String docNo);
	public int getCntUnRead(String docNo);
	
	// 결재선
	public boolean applineInsert(String docNo, int eno, String category);
	public int getEno(String ename);
	public List<DoclineVO> getDoclines(String docNo);
}