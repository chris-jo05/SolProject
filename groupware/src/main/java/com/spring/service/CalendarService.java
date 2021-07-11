package com.spring.service;

import java.util.List;

import com.spring.domain.CalendarRepEmpVO;
import com.spring.domain.CalendarVO;
import com.spring.domain.MemberVo;

public interface CalendarService {
	public List<CalendarVO> getList();
	public CalendarVO get(int cno);
	public boolean insert(CalendarVO vo);
	public boolean delete(int cno);
	public List<CalendarRepEmpVO> getRepName(String title);
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo);
}
