package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CalendarRepEmpVO;
import com.spring.domain.CalendarVO;
import com.spring.domain.MemberVo;

public interface CalendarMapper {
	public List<CalendarVO> list(int eno);
	public CalendarVO get(int cno);
	public int insert(CalendarVO vo);
	public int delete(String groupId);
	public List<CalendarRepEmpVO> getRepName(String groupId);
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo);
}
