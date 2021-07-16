package com.spring.calendar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.calendar.domain.CalendarRepEmpVO;
import com.spring.calendar.domain.CalendarVO;
import com.spring.member.domain.MemberVo;

public interface CalendarMapper {
	public List<CalendarVO> list(int eno);
	public CalendarVO get(int cno);
	public int insert(CalendarVO vo);
	public int delete(String groupId);
	public List<CalendarRepEmpVO> getRepName(String groupId);
	public CalendarRepEmpVO getRepNo(CalendarRepEmpVO vo);
	
	public List<String> dept_list();
	public List<String> emp_list(String dname);
	
	public int updateCheck(@Param("cno") int cno, @Param("cal_check") String cal_check);
	public List<String> groupIdCheck();
}
