package com.spring.calendar.service;

import java.util.List;

import com.spring.calendar.domain.CalendarRepEmpVO;
import com.spring.calendar.domain.CalendarVO;
import com.spring.member.domain.MemberVo;

public interface CalendarService {
	public List<CalendarVO> getList(int eno);
	public CalendarVO get(int cno);
	public boolean insert(CalendarVO vo);
	public boolean delete(String groupId);
	public List<CalendarRepEmpVO> getRepName(String groupId);
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo);
	
	public List<String> dept_list();
	public List<String> emp_list(String dname);
}
