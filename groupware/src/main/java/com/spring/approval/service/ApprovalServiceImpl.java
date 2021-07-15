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
	public List<ApprovalVO> approvalList(int eno) {
		return mapper.approvalList(eno);
	}

	@Override
	public ApprovalVO approvalRead(String docNo, int eno) {
		return mapper.approvalRead(docNo);
	}

	@Override
	public boolean approvalWrite(ApprovalVO VO) {
		boolean result = mapper.approvalWrite(VO) > 0 ? true : false;
		return result;
	}
}