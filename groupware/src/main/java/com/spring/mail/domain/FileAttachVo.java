package com.spring.mail.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileAttachVo {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int m_no;
}
