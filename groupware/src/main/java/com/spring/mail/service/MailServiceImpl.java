package com.spring.mail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.Criteria;
import com.spring.mail.domain.FileAttachVo;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;
import com.spring.mail.mapper.MailAttachMapper;
import com.spring.mail.mapper.MailBeanMapper;
import com.spring.mail.mapper.MailBoardMapper;

@Service
public class MailServiceImpl implements MailBoardService {

	@Autowired
	private MailBoardMapper mapper;
	@Autowired
	private MailBeanMapper beanMapper;
	@Autowired
	private MailAttachMapper attachMapper;
	
	@Override
	public List<MailBoardVo> mailList(Criteria cri, String e_id) {
		return mapper.mailList(cri, e_id);
	}
	
	@Override
	public int totalCnt(String e_id) {
		return mapper.totalCnt (e_id);
	}

	@Transactional
	@Override
	public MailBoardVo readMail(int m_no, String e_id) {
		
		MailBoardVo vo = mapper.readMail(m_no);
		if(vo.getE_id() == e_id) {
			mapper.readVal(true, m_no);
			return vo;
		}else {
			return vo;
		}
	}

	@Transactional
	@Override
	public int writeMail(MailBoardVo write) {
		
		//새글 등록하기
		int result = mapper.writeMail(write);
		
		// 첨부 파일 등록하기
		if(write.getAttachList() == null || write.getAttachList().size() <= 0) {
			return result;
		}
		
		write.getAttachList().forEach(attach ->{
			attach.setM_no(write.getM_no());
			attachMapper.attachInsert(attach);
		});
		return result;
	}

	@Override
	public List<MailBoardVo> sendMailBox(Criteria cri, String m_id) {
		return mapper.sendMailBox(cri, m_id);
	}
	
	@Override
	public int sendTotalCnt(String m_id) {
		return mapper.sendTotalCnt(m_id);
	}

	@Transactional
	@Override
	public int deleteMail(int m_no) {
		// 휴지통에 메일을 만들어 주면서 받은편지함에서 삭제해준다.
		beanMapper.beanInMail(m_no);
		return mapper.deleteMail(m_no);
	}

	@Transactional
	@Override
	public int deleteMailList(MailRemoveVo removeMail) {
		beanMapper.insertInBean(removeMail);
		attachMapper.attachFileList(removeMail);
		attachMapper.insertAttachInBean(removeMail);
		return mapper.deleteMailList(removeMail);
	}
	
	@Override
	public List<MailBoardVo> beanListMail(Criteria cri, String e_id) {
		return beanMapper.beanListMail(cri, e_id);
	}

	@Override
	public int totalBeanCnt(String e_id) {
		return beanMapper.totalBeanCnt(e_id);
	}
	
	@Override
	public MailBoardVo beanReadMail(int m_no) {
		return beanMapper.beanReadMail(m_no);
	}

	@Override
	public List<FileAttachVo> getAttachList(int m_no) {
		return attachMapper.findByMno(m_no);
	}




	


}
