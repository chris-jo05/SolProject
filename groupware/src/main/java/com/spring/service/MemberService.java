package com.spring.service;


import java.util.List;


import com.spring.domain.MemberVo;

public interface MemberService {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	public boolean insert(MemberVo vo);
	public List<MemberVo> list();

}
