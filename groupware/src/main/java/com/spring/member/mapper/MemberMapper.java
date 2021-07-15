package com.spring.member.mapper;

import java.util.List;

import com.spring.member.domain.MemberVo;

public interface MemberMapper {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	public int insert(MemberVo vo);
	public List<MemberVo> list();
	public MemberVo selectMember(int eno);
	public int update(MemberVo vo);
	
}
