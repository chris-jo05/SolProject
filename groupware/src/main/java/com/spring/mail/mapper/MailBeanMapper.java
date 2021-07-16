package com.spring.mail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.Criteria;
import com.spring.mail.domain.FileAttachVo;
import com.spring.mail.domain.MailBoardVo;
import com.spring.mail.domain.MailRemoveVo;

public interface MailBeanMapper {
	// 휴지통 메일 리스트 받기, 페이지 나누기
	public List<MailBoardVo> beanListMail(@Param("cri") Criteria cri, @Param("e_id") String e_id);
	public int totalBeanCnt(String e_id);
	
	//휴지통에 있는 메일 읽기
	public MailBoardVo beanReadMail(@Param("m_no") int m_no, @Param("e_id") String e_id);
	
	// 받은 메일함에서 삭제하면 휴지통에 넣기
	public int beanInMail(FileAttachVo file);
	public int insertInBean(MailRemoveVo removeMail);
	
	// 휴지통 비우기
	public int deleteBeanMailList(MailRemoveVo removeMail);
	public int deleteBeanMail(int m_no);
}
