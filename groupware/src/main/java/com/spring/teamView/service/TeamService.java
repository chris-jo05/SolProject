package com.spring.teamView.service;

import java.util.List;

import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;

public interface TeamService {
	public List<TeamNameVo> teamList();
	public int newTeam(String dname, String dphone);
	public List<TeamMemberVo> showTeamList(int dno);
}