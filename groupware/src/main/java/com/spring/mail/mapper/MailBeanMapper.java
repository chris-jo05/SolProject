package com.spring.mail.mapper;

import java.util.List;

import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBeanMapper {
	public int beanInMail(int m_no);
	public List<MailBoardVo> beanListMail(String e_id);
	public MailBoardVo beanReadMail(int m_no);
	public int insertInBean(MailRemoveVo removeMail);
}
