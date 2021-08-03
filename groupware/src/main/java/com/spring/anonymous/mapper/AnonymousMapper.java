package com.spring.anonymous.mapper;

import java.util.List;

import com.spring.anonymous.domain.AnonymousVO;
import com.spring.anonymous.domain.Criteria;

public interface AnonymousMapper {
	public List<AnonymousVO> list(Criteria cri);
	public int insert(AnonymousVO vo);
	public AnonymousVO read(int ano);
	public String checkpw(int ano);
	public int delete(int ano);
	public int update(AnonymousVO vo);
	public int totalAn(Criteria cri);
	public int totalAsr(Criteria cri);
}
