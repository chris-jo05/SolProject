package com.spring.teamView.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TeamMemberVo {
	private String id;
	private String ename;
	private String position;
	private String mobile;
	private String dname;
	private int eno;
	private int dno;
}
