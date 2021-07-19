package com.spring.teamView.service;

import java.util.List;

import com.spring.teamView.domain.TeamCriteria;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

public interface TeamService {
	public List<TeamNameVo> teamList(TeamCriteria cri);
	public int totalTeam();
	public int newTeam(String dname, String dphone);
	public List<TeamMemberVo> showTeamList(TeamCriteria cri, int dno);
	public int totalTeamCount(int dno);
}
