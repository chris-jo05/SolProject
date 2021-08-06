package com.spring.approval.domain;

import java.util.Date;
import java.util.List;

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

public class ApprovalVO {
	private String docNo; // 문서번호
	private String docClass; // 문서분류
	private Date docDate; // 기안일자
	private int dno; // 기안부서번호
	private int eno; // 기안자사번
	private Date docStartDate; // 시작일자
	private Date docEndDate; // 종료일자
	private String docKind; // 근태구분
	private String docTitle; // 문서제목
	private String docContent; // 문서내용
	private String docRef; // 참조자
	private String docRefEno; // 참조자 사원번호
	private String docImp; // 시행자
	private String docImpEno; // 시행자 사원번호
	
	private String dname; // 기안부서이름
	private String ename; // 가인자이름
	
	//첨부 파일 리스트
	private List<ApprovalAttachVO> appAttachList;
	
	// 결재선 정보
	private String sign_position1;
	private String sign_position2;
	private String sign_position3;
	private String sign_position4;
	
	private String sign_ename1;
	private String sign_ename2;
	private String sign_ename3;
	private String sign_ename4;
	
	private String con_position1;
	private String con_position2;
	private String con_position3;
	private String con_position4;
	
	private String con_ename1;
	private String con_ename2;
	private String con_ename3;
	private String con_ename4;
	
	private int doc_seq;
	
}
