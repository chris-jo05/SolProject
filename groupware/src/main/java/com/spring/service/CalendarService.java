package com.spring.service;

import java.util.List;

import com.spring.domain.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getList();
	public CalendarVO get(int cno);
	public List<String> getRepName(String title);
}
