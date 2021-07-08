package com.spring.mapper;

import java.util.List;

import com.spring.domain.MailBoardVo;

public interface MailBoardMapper {
	public List<MailBoardVo> mailList(String e_id);
	public MailBoardVo readMail(int m_no);
	public int writeMail(MailBoardVo write);
}
