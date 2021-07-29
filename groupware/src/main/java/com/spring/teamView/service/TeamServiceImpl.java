package com.spring.teamView.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.teamView.domain.TeamCriteria;
import com.spring.teamView.domain.TeamMemberVo;
import com.spring.teamView.domain.TeamNameVo;
import com.spring.teamView.mapper.TeamMapper;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	@Override
	public List<TeamNameVo> teamList(TeamCriteria cri) {
		return mapper.teamList(cri);
	}

	@Override
	public int totalTeam() {
		return mapper.totalTeam();
	}

	@Override
	public int newTeam(String dname, String dphone) {
		return mapper.newTeam(dname, dphone);
	}

	@Override
	public List<TeamMemberVo> showTeamList(TeamCriteria cri ,int dno) {
		return mapper.showTeamList(cri, dno);
	}

	@Override
	public int totalTeamCount(int dno) {
		return mapper.totalTeamCount(dno);
	}

	@Override
	public List<TeamNameVo> appLineDept() {
		return mapper.appLineDept();
	}

	@Override
	public List<TeamMemberVo> appLineMember(int dno) {
		return mapper.appLineMember(dno);
	}

	@Override
	public List<TeamMemberVo> appSelectedMember(int eno) {
		return mapper.appSelectedMember(eno);
	}
}
