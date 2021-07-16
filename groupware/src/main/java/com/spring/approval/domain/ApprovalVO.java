package com.spring.approval.domain;

import java.util.Date;

import com.spring.member.domain.MemberVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class ApprovalVO {
	private String docNo; // 문서번호
	private String docClass; // 문서분류
	private Date docDate; // 기안일자
	private int dno; // 기안부서번호
	private int eno; // 기안자번호
	private String docTitle; // 제목
	private String docContent; // 내용
	private Date docStartDate; // 시작일자
	private Date docEndDate; // 종료일자
	private String docKind; // 근태구분

	private String dname; // 기안부서이름
	private String ename; // 기안자이름
}