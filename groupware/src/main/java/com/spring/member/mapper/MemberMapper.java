package com.spring.member.mapper;

import java.util.List;

import com.spring.member.domain.Criteria;
import com.spring.member.domain.MemberVo;

public interface MemberMapper {
	public MemberVo login(MemberVo vo);
	public MemberVo profile(MemberVo vo);
	public int insert(MemberVo vo);
	public List<MemberVo> list(Criteria cri);
	public MemberVo selectMember(int eno);
	public int update(MemberVo vo);
	public int totalEn(Criteria cri);
	public List<MemberVo> search(Criteria cri);
	public int totalSr(Criteria cri);
}
