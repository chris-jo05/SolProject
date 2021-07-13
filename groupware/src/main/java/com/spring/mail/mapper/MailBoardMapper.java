package com.spring.mail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBoardMapper {
	public List<MailBoardVo> mailList(String e_id);
	public MailBoardVo readMail(int m_no);
	public int readVal(@Param("m_read") boolean m_read, @Param("m_no") int m_no);
	public int writeMail(MailBoardVo write);
	public List<MailBoardVo> sendMailBox(String m_id);
	
	public int deleteMail(int m_no);
	
	public int deleteMailList(MailRemoveVo removeMail);
}
