package com.spring.service;


import com.spring.domain.MemberVo;

public interface MemberService {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);

	
}
