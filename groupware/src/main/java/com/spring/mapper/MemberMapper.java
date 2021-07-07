package com.spring.mapper;

import com.spring.domain.MemberVo;

public interface MemberMapper {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	
}
