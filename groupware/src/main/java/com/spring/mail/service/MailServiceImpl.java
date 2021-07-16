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
		
		MailBoardVo vo = mapper.readMail(m_no,e_id);
		System.out.println(vo.getE_id()+"읽는지 테스트중");
		if(vo.getM_id() != e_id) {
			System.out.println(e_id);
			System.out.println(vo.getE_id());
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
	public int deleteMail(FileAttachVo file) {
		// 휴지통에 메일을 만들어 주면서 받은편지함에서 삭제해준다.
		beanMapper.beanInMail(file);
		attachMapper.deleteFile(file);
		attachMapper.insertFile(file);
		return mapper.deleteMail(file);
	}

	@Transactional
	@Override
	public int deleteMailList(MailRemoveVo removeMail) {
		beanMapper.insertInBean(removeMail);
		attachMapper.insertAttachInBean(removeMail);
		attachMapper.attachFileList(removeMail);
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
	public MailBoardVo beanReadMail(int m_no, String e_id) {
		return beanMapper.beanReadMail(m_no, e_id);
	}

	@Override
	public List<FileAttachVo> getAttachList(int m_no) {
		return attachMapper.findByMno(m_no);
	}

	@Transactional
	@Override
	public int deleteBeanMailList(MailRemoveVo removeMail) {
		attachMapper.attachFileBeanList(removeMail);
		return beanMapper.deleteBeanMailList(removeMail);
	}

	@Transactional
	@Override
	public int deleteBeanMail(int m_no) {
		attachMapper.deleteAttachFile(m_no);
		return beanMapper.deleteBeanMail(m_no);
	}

	@Override
	public MailBoardVo readSendMail(int m_no, String m_id) {
		return mapper.readSendMail(m_no, m_id);
	}

	@Override
	public int getCntUnRead(String e_id) {
		return mapper.getCntUnRead(e_id);
	}

	

}
