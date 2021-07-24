package com.spring.attendance.service;

import java.util.List;

import com.spring.attendance.domain.AttendanceVO;
import com.spring.board.domain.Criteria;

public interface AttendanceService {
	public List<AttendanceVO> list(Criteria cri, int eno, String workDay);
	public boolean insert(AttendanceVO vo);
	public boolean update(AttendanceVO vo);
	public List<AttendanceVO> check(int eno, String workDay);
	public int totalCnt(int eno, String workDay);
}
