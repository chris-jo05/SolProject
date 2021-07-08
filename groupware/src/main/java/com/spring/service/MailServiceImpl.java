package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MailBoardVo;
import com.spring.mapper.MailBoardMapper;

@Service
public class MailServiceImpl implements MailBoardService {

	@Autowired
	private MailBoardMapper mapper;
	
	@Override
	public List<MailBoardVo> mailList(String e_id) {
		return mapper.mailList(e_id);
	}

	@Override
	public MailBoardVo readMail(int m_no) {
		return mapper.readMail(m_no);
	}

	@Override
	public int writeMail(MailBoardVo write) {
		return mapper.writeMail(write);
	}

}
