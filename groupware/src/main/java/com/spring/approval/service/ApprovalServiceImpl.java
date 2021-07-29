package com.spring.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.approval.domain.ApprovalAttachVO;
import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.mapper.ApprovalAttachMapper;
import com.spring.approval.mapper.ApprovalMapper;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

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
	public ApprovalVO appRead(String docNo, int eno) {
		return appMapper.appRead(docNo, eno);
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
}