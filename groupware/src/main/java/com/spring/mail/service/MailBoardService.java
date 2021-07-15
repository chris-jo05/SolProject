package com.spring.mail.service;

import java.util.List;

import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBoardService {
	public List<MailBoardVo> mailList(String e_id);
	public MailBoardVo readMail(int m_no,String e_id);
	public int writeMail(MailBoardVo write);
	public List<MailBoardVo> sendMailBox(String m_id);
	public int deleteMail(int m_no);
	public int deleteMailList(MailRemoveVo removeMail);
	
	// 휴지통에 대한 서비스
	public List<MailBoardVo> beanListMail(String e_id);
	public MailBoardVo beanReadMail(int m_no);
	
}
