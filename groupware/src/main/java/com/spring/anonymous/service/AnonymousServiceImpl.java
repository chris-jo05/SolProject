package com.spring.anonymous.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.domain.Criteria;
import com.spring.anonymous.mapper.AnonymousMapper;

@Service
public class AnonymousServiceImpl implements AnonymousService {
	
	@Autowired
	private AnonymousMapper mapper;
	
	
	@Override
	public List<AnonymousVO> list(Criteria cri) {
		return mapper.list(cri);
	}
	
	@Override
	public boolean insert(AnonymousVO vo) {
		return mapper.insert(vo)>0?true:false;
	}
	
	@Override
	public AnonymousVO read(int ano) {
		return mapper.read(ano);
	}
	
	@Override
	public String checkpw(int ano) {
		return mapper.checkpw(ano);
	}
	
	@Override
	public boolean delete(int ano) {
		return mapper.delete(ano)>0?true:false;
	}
	
	@Override
	public boolean update(AnonymousVO vo) {
		return mapper.update(vo)>0?true:false;
	}
	
	@Override
	public int total(Criteria cri) {
		return mapper.totalAn(cri);
	}
	
	@Override
	public int totalAsr(Criteria cri) {
		return mapper.totalAsr(cri);
	}
}
