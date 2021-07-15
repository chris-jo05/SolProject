package com.spring.mail.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MailBoardVo {
	private int m_no;			// 메일에 대한 고유 번호
	private String m_title;		// 메일 제목
	private String m_content;	// 메일 내용
	private Date m_sendDate;	// 메일 보낸 날짜
	private boolean m_read;		// 메일 읽었는지에 대한 여부
	private int eno;			// 사원 번호
	private String e_id;		// 메일 받는 사람 아이디
	private String m_writer;	// 보낸 사람 이름
	private String m_id;		// 보낸 사람 아이디
	
	//첨부 파일 리스트
	private List<FileAttachVo> attachList;
}
