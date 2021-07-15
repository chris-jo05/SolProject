package com.spring.mail.mapper;

import java.util.List;

import com.spring.mail.domain.FileAttachVo;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailAttachMapper {
	public int attachInsert(FileAttachVo attach);
	public List<FileAttachVo> findByMno(int m_no);
	public int attachFileList(MailRemoveVo removeMail);
	public int insertAttachInBean(MailRemoveVo removeMail);
}
