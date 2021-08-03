package com.spring.anonymous.service;

import java.util.List;

import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.domain.Criteria;

public interface AnonymousService {
	public boolean insert(AnonymousVO vo);
	public List<AnonymousVO> list(Criteria cri);
	public AnonymousVO read(int ano);
	public String checkpw(int ano);
	public boolean delete(int ano);
	public boolean update(AnonymousVO vo);
	public int total(Criteria cri);
	public int totalAsr(Criteria cri);
}
