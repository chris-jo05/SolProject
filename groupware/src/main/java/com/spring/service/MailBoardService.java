package com.spring.service;

import java.util.List;

import com.spring.domain.MailBoardVo;

public interface MailBoardService {
	public List<MailBoardVo> mailList(String e_id);
	public MailBoardVo readMail(int m_no);
	public int writeMail(MailBoardVo write);
}
