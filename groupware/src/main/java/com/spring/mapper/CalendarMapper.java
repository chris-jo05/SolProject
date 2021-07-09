package com.spring.mapper;

import java.util.List;

import com.spring.domain.CalendarVO;

public interface CalendarMapper {
	public List<CalendarVO> list();
	public CalendarVO get(int cno);
	public List<String> getRepName(String title);
}
