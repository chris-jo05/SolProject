package com.spring.teamView.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

public interface TeamMapper {
	public List<TeamNameVo> teamList();	// 조직도에서 전체 부서 조회
	public int newTeam(@Param("dname") String dname, @Param("dphone") String dphone); //부서 생성
	public List<TeamMemberVo> showTeamList(int dno);	// dno를 받아 팀원들의 정보를 받는다
}
