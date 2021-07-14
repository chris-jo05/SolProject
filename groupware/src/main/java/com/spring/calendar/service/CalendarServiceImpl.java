package com.spring.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.calendar.domain.CalendarRepEmpVO;
import com.spring.calendar.domain.CalendarVO;
import com.spring.calendar.mapper.CalendarMapper;
import com.spring.member.domain.MemberVo;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarMapper mapper;
	
	@Override
	public List<CalendarVO> getList(int eno) {
		return mapper.list(eno);
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
	public boolean delete(String groupId) {
		return mapper.delete(groupId) > 0 ? true : false;
	}
	
	@Override
	public List<CalendarRepEmpVO> getRepName(String groupId) {
		return mapper.getRepName(groupId);
	}
	
	@Override
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo) {
		return mapper.getRepNo(vo);
	}
	
	@Override
	public List<String> dept_list() {
		return mapper.dept_list();
	}
	
	@Override
	public List<String> emp_list(String dname) {
		return mapper.emp_list(dname);
	}
}
