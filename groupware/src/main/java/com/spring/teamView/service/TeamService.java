package com.spring.teamView.service;

import java.util.List;

import com.spring.member.domain.MemberVo;
import com.spring.teamView.domain.TeamCriteria;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

public interface TeamService {
	public List<TeamNameVo> teamList(TeamCriteria cri);
	public int totalTeam();
	public int newTeam(String dname, String dphone);
	public List<TeamMemberVo> showTeamList(TeamCriteria cri, int dno);
	public int totalTeamCount(int dno);
	
	// 결재선
	public List<TeamNameVo> appLineDept();
	public List<TeamMemberVo> appLineMember(int dno);
	public List<TeamMemberVo> appSelectedMember(int eno);
}
