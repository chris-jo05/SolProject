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
	private ApprovalMapper mapper;
	
	@Autowired
	private ApprovalAttachMapper Attachmapper;

	@Override
	public List<ApprovalVO> appList(int eno) {
		return mapper.appList(eno);
	}

	@Override
	public ApprovalVO appRead(String docNo, int eno) {
		return mapper.appRead(docNo);
	}

	@Override
	public int appWrite(ApprovalVO appWrite) {
		int result = mapper.appWrite(appWrite);
		
		// 첨부 파일 등록하기
		if(appWrite.getAppAttachList() == null || appWrite.getAppAttachList().size() <= 0) {
			return result;
		}
		
		appWrite.getAppAttachList().forEach(attach ->{
			attach.setDocNo(appWrite.getDocNo());
			Attachmapper.AppAttachInsert(attach);
		});
		return result;
	}
	
	@Override
	public List<ApprovalAttachVO> appAttachList(String docNo) {
		return Attachmapper.AppAttachRead(docNo);
	}

	@Override
	public int getCntUnRead(String e_id) {
		// TODO Auto-generated method stub
		return 0;
	}
}