package com.spring.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.attendance.domain.AttendanceVO;
import com.spring.attendance.mapper.AttendanceMapper;
import com.spring.board.domain.Criteria;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceMapper mapper;
	
	public List<AttendanceVO> list(Criteria cri, int eno) {
		return mapper.list(cri, eno);
	}
	
	@Override
	public boolean insert(AttendanceVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
	@Override
	public boolean update(AttendanceVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}
	
	@Override
	public List<AttendanceVO> check(int eno, String workDay) {
		return mapper.check(eno, workDay);
	}
	
	@Override
	public int totalCnt(int eno) {
		return mapper.totalCnt(eno);
	}
}
