package com.spring.anonymous.mapper;

import java.util.List;

import com.spring.anonymous.domain.AnonymousReplyVO;


public interface AnonymousReplyMapper {
	public int insert(AnonymousReplyVO reply);
	public List<AnonymousReplyVO> replylist(int ano);
	public int delete(int reno);
	public String replyCheckPw(int reno);
}
