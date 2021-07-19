package com.spring.teamView.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.teamView.domain.TeamNameVo;

public interface TeamMapper {
	public List<TeamNameVo> teamList();	// 조직도에서 전체 부서 조회
	public int newTeam(@Param("dname") String dname, @Param("dphone") String dphone);
}
