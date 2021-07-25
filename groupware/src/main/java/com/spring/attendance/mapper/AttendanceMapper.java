package com.spring.attendance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.attendance.domain.AttendanceVO;
import com.spring.board.domain.Criteria;

public interface AttendanceMapper {
	public List<AttendanceVO> list(@Param("cri") Criteria cri,@Param("eno") int eno,@Param("workDay") String workDay);
	public int insert(AttendanceVO vo);
	public int update(AttendanceVO vo);
	public List<AttendanceVO> check(@Param("eno") int eno,@Param("workDay") String workDay);
	public int totalCnt(@Param("eno") int eno,@Param("workDay") String workDay);
}
