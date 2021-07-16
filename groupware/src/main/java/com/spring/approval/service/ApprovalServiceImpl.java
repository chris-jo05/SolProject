package com.spring.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.approval.domain.ApprovalVO;
import com.spring.approval.mapper.ApprovalMapper;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalMapper mapper;

	@Override
	public List<ApprovalVO> appList(int eno) {
		return mapper.appList(eno);
	}

	@Override
	public ApprovalVO appRead(String docNo, int eno) {
		return mapper.appRead(docNo);
	}

	@Override
	public ApprovalVO appReadPeriod(String docNo, String docKind, int eno) {
		return mapper.appReadPeriod(docNo, docKind);
	}

	@Override
	public int appWrite(ApprovalVO appWrite) {
		int result = mapper.appWrite(appWrite);
		return result;
	}
}