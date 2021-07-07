package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVo;
import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public MemberVo login(MemberVo vo) {
		return mapper.login(vo);
	}

	@Override
	public MemberVo profile(MemberVo vo) {
		return mapper.profile(vo);
	}

}
