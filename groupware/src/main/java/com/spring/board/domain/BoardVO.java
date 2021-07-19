package com.spring.board.domain;

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
public class BoardVO {
	private int bno;
	private String b_title;
	private String b_writer;
	private int dno;
	private String b_contents;
	private Date b_date;
	private Date b_updatedate;
	private int hit;
	private String dname;
	
	private int b_prev;	// 이전페이지
	private int b_next;	// 다음페이지
	private List<AttachFileDTO> attachList;
}