package com.spring.member.service;


import java.util.List;

import com.spring.member.domain.Criteria;
import com.spring.member.domain.MemberVo;

public interface MemberService {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	public boolean insert(MemberVo vo);
	public List<MemberVo> list(Criteria cri);
	public MemberVo selectMember(int eno);
	public boolean update(MemberVo vo);
	public int total(Criteria cri);
	public List<MemberVo> search(Criteria cri);
	public int totalSr(Criteria cri);
	public MemberVo dupId(String id);
}
