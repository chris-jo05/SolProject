package com.spring.anonymous.service;

import java.util.List;

import com.spring.anonymous.domain.AnonymousReplyVO;

public interface AnonymousReplyService {
	public boolean replyinsert(AnonymousReplyVO reply);
	public List<AnonymousReplyVO> replylist(int ano);
	public boolean replydelete(int reno);
	public String replyCheckPw(int reno);
}
