package com.spring.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.mapper.ApprovalAttachMapper;
import com.spring.approval.mapper.ApprovalMapper;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalMapper appMapper;

	@Autowired
	private ApprovalAttachMapper appAttachMapper;

	@Override
	public List<ApprovalVO> appList(int eno) {
		return appMapper.appList(eno);
	}

	@Override
	public List<ApprovalVO> appListRec(int eno) {
		return appMapper.appListRec(eno);
	}

	@Override
	public List<ApprovalVO> appListImp(int eno) {
		return appMapper.appListImp(eno);
	}

	@Override
	public List<ApprovalVO> appListRet(int eno) {
		return appMapper.appListRet(eno);
	}

	@Override
	public List<ApprovalVO> appListRef(int eno) {
		return appMapper.appListRef(eno);
	}

	@Override
	public ApprovalVO appRead(String docNo, int eno) {
		return appMapper.appRead(docNo, eno);
	}

	@Override
	public ApprovalVO appReadRec(String docNo, int eno) {
		return appMapper.appReadRec(docNo, eno);
	}

	@Override
	public ApprovalVO appReadImp(String docNo, int eno) {
		return appMapper.appReadImp(docNo, eno);
	}

	@Override
	public ApprovalVO appReadRet(String docNo, int eno) {
		return appMapper.appReadRet(docNo, eno);
	}

	@Override
	public ApprovalVO appReadRef(String docNo, int eno) {
		return appMapper.appReadRef(docNo, eno);
	}

	@Override
	public int appWrite1(ApprovalVO appWrite1) {

		//새글 등록하기
		int result = appMapper.appWrite1(appWrite1);

		// 첨부 파일 등록하기
		if (appWrite1.getAppAttachList() == null || appWrite1.getAppAttachList().size() <= 0) {
			return result;
		}

		appWrite1.getAppAttachList().forEach(attach ->
		{
			attach.setDocNo(appWrite1.getDocNo());
			appAttachMapper.appAttachInsert(attach);
		});
		return result;
	}

	@Override
	public int appWrite2(ApprovalVO appWrite2) {

		//새글 등록하기
		int result = appMapper.appWrite1(appWrite2);

		// 첨부 파일 등록하기
		if (appWrite2.getAppAttachList() == null || appWrite2.getAppAttachList().size() <= 0) {
			return result;
		}

		appWrite2.getAppAttachList().forEach(attach ->
		{
			attach.setDocNo(appWrite2.getDocNo());
			appAttachMapper.appAttachInsert(attach);
		});
		return result;
	}

	@Override
	public List<ApprovalAttachVO> appAttachList(String docNo) {
		return appAttachMapper.appAttachList(docNo);
	}

	@Override
	public int getCntUnRead(String docNo) {
		return appMapper.getCntUnRead(docNo);
	}
	
	@Override
	public boolean applineInsert(String docNo, int eno, String category) {
		return appMapper.applineInsert(docNo, eno, category) > 0 ? true : false;
	}
	
	@Override
	public int getEno(String ename) {
		return appMapper.getEno(ename);
	}
}