package com.spring.service;

import java.util.List;

import com.spring.domain.CalendarRepEmpVO;
import com.spring.domain.CalendarVO;
import com.spring.domain.MemberVo;

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
