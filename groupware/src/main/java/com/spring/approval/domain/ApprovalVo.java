package com.spring.approval.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class ApprovalVo {
	private Date docDate; // 기안일자
	private String dname; // 기안부서
	private String ename; // 기안자
	private String position; // 제목
	private String birthday; // 내용
	private String address; // 첨부파일
}