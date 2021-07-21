package com.spring.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.domain.Criteria;
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
	public List<MemberVo> list(Criteria cri) {
		return mapper.list(cri);
	}
	
	@Override
	public MemberVo selectMember(int eno) {
		return mapper.selectMember(eno);
	}

	@Override
	public boolean update(MemberVo vo) {
		return mapper.update(vo)>0?true:false;
	}

	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalEn(cri);
	}

	@Override
	public List<MemberVo> search(Criteria cri) {
		return mapper.search(cri);
	}

	@Override
	public int totalSr(Criteria cri) {
		return mapper.totalSr(cri);
	}

	@Override
	public MemberVo dupId(String id) {
		return mapper.dupId(id);
	}
}
