package com.spring.mail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;
import com.spring.mail.mapper.MailBeanMapper;
import com.spring.mail.mapper.MailBoardMapper;

@Service
public class MailServiceImpl implements MailBoardService {

	@Autowired
	private MailBoardMapper mapper;
	@Autowired
	private MailBeanMapper beanMapper;
	
	@Override
	public List<MailBoardVo> mailList(String e_id) {
		return mapper.mailList(e_id);
	}

	@Transactional
	@Override
	public MailBoardVo readMail(int m_no, String e_id) {
		
		MailBoardVo vo = mapper.readMail(m_no);
		if(vo.getE_id() != e_id) {
			System.out.println("트랜잭션 테스트 " + vo.getE_id());
			return vo;
		}
		mapper.readVal(true, m_no);
		return vo;
	}

	@Override
	public int writeMail(MailBoardVo write) {
		return mapper.writeMail(write);
	}

	@Override
	public List<MailBoardVo> sendMailBox(String m_id) {
		return mapper.sendMailBox(m_id);
	}

	@Transactional
	@Override
	public int deleteMail(int m_no) {
		beanMapper.beanInMail(m_no);
		return mapper.deleteMail(m_no);
	}

	@Transactional
	@Override
	public int deleteMailList(MailRemoveVo removeMail) {
		beanMapper.insertInBean(removeMail);
		return mapper.deleteMailList(removeMail);
	}
	
	@Override
	public List<MailBoardVo> beanListMail(String e_id) {
		return beanMapper.beanListMail(e_id);
	}

	@Override
	public MailBoardVo beanReadMail(int m_no) {
		return beanMapper.beanReadMail(m_no);
	}


}
