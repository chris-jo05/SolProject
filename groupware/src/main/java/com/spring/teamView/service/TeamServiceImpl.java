package com.spring.teamView.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.teamView.domain.TeamNameVo;
import com.spring.teamView.mapper.TeamMapper;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	@Override
	public List<TeamNameVo> teamList() {
		return mapper.teamList();
	}

	@Override
	public int newTeam(String dname, String dphone) {
		return mapper.newTeam(dname, dphone);
	}

}
