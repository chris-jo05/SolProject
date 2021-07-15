package com.spring.member.service;


import java.util.List;

import com.spring.member.domain.MemberVo;

public interface MemberService {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	public boolean insert(MemberVo vo);
	public List<MemberVo> list();

}
