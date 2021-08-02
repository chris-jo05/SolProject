package com.spring.teamView.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.member.domain.MemberVo;
import com.spring.teamView.domain.TeamCriteria;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

public interface TeamMapper {
	public List<TeamNameVo> teamList(TeamCriteria cri);	// 조직도에서 전체 부서 조회
	public int totalTeam();	// 전체 부서의 수 구하기
	
	public int newTeam(@Param("dname") String dname, @Param("dphone") String dphone); //부서 생성
	
	public List<TeamMemberVo> showTeamList(@Param("cri")TeamCriteria cri ,@Param("dno") int dno);	// dno를 받아 팀원들의 정보를 받는다
	public int totalTeamCount(int dno);

	public List<TeamNameVo> appLineDept();
	public List<TeamMemberVo> appLineMember(int dno);
	public List<TeamMemberVo> appSelectedMember(int eno);
}
