package com.spring.mail.service;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.mail.domain.FileAttachVo;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBoardService {
	// 받은 메일함
	public List<MailBoardVo> mailList(Criteria cri, String e_id);
	public int totalCnt(String e_id);
	
	// 보낸 메일함
	public List<MailBoardVo> sendMailBox(Criteria cri, String m_id);
	public int sendTotalCnt(String m_id);
	
	public MailBoardVo readMail(int m_no,String e_id);
	public int writeMail(MailBoardVo write);
	public int deleteMail(int m_no);
	public int deleteMailList(MailRemoveVo removeMail);
	
	// 휴지통에 대한 서비스
	public List<MailBoardVo> beanListMail(Criteria cri, String e_id);
	public int totalBeanCnt(String e_id);
	public MailBoardVo beanReadMail(int m_no);
	
	// 파일 첨부 가져오기
	public List<FileAttachVo> getAttachList(int m_no);
}
