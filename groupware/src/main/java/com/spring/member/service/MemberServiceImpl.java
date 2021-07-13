package com.spring.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.domain.MemberVo;
import com.spring.member.mapper.MemberMapper;

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

	@Override
	public boolean insert(MemberVo vo) {
		return mapper.insert(vo)>0?true:false;
	}
	
	@Override
	public List<MemberVo> list() {
		return mapper.list();
	}

}
