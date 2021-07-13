package com.spring.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter

public class ApprovalVO {
	private String docNo; // 문서번호
	private String docClass; // 문서분류
	private Date docDate; // 기안일자
	private String dname; // 기안부서이름
	private int dno; // 기안부서번호
	private String ename; // 기안자이름
	private int eno; // 기안자번호
	private String docTitle; // 제목
	private String docContent; // 내용
}