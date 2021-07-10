package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CalendarRepEmpVO;
import com.spring.domain.CalendarVO;
import com.spring.domain.MemberVo;
import com.spring.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarMapper mapper;
	
	@Override
	public List<CalendarVO> getList() {
		return mapper.list();
	}
	
	@Override
	public CalendarVO get(int cno) {
		return mapper.get(cno);
	}
	
	@Override
	public boolean insert(CalendarVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
	@Override
	public List<CalendarRepEmpVO> getRepName(String title) {
		return mapper.getRepName(title);
	}
	
	@Override
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo) {
		return mapper.getRepNo(vo);
	}
}
