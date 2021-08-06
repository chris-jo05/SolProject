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
public class DoclineVO {
	private String docNo;
	private int eno;
	private Date doc_lineappdate;
	private String doc_lineappcom;
	private char doc_lineappsta;
	private String doc_linecategory;
	private String ename;
	private String position;
}
