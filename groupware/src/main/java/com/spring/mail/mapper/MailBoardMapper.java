package com.spring.mail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.Criteria;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBoardMapper {
	// 받은 메일함
	public List<MailBoardVo> mailList(@Param("cri") Criteria cri, @Param("e_id") String e_id);
	public int totalCnt(String e_id);	// 페이지 나누기를 위한 총 받은 메일함 수 구하기(받은 메일함)
	// 보낸 메일함
	public List<MailBoardVo> sendMailBox(@Param("cri") Criteria cri, @Param("m_id") String m_id);
	public int sendTotalCnt(String m_id);	//보낸 메일함 총 수를 구하기

	public MailBoardVo readMail(int m_no);
	public int readVal(@Param("m_read") boolean m_read, @Param("m_no") int m_no);
	public int writeMail(MailBoardVo write);
	
	public int deleteMail(int m_no);
	public int deleteMailList(MailRemoveVo removeMail);	//list로 지우기
}
