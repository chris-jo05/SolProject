package com.spring.approval.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class ApprovalAttachVO {
	private int doc_fileNo;
	private String docNo;
	private String doc_fileName;
	private String doc_uploadPath;
	private boolean doc_fileType;
	private String doc_uuid;
}
