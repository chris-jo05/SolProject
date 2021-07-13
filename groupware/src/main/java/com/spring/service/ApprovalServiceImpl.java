package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ApprovalVO;
import com.spring.domain.ApprovalVO;
import com.spring.mapper.ApprovalMapper;
import com.spring.mapper.ApprovalMapper;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalMapper mapper;
	
	@Override
	public List<ApprovalVO> approvalList(int eno) {
		return mapper.approvalList(eno);
	}

	@Override
	public ApprovalVO readApproval(int docNo) {
		return mapper.readApproval(docNo);
	}
}