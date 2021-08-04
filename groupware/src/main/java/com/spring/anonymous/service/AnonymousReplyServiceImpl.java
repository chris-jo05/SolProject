package com.spring.anonymous.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.anonymous.domain.AnonymousReplyVO;
import com.spring.anonymous.mapper.AnonymousReplyMapper;


@Service
public class AnonymousReplyServiceImpl implements AnonymousReplyService {
	

	
	@Autowired
	AnonymousReplyMapper mapper;
	
	@Override
	public boolean replyinsert(AnonymousReplyVO reply) {
		return mapper.insert(reply)>0?true:false;
	}
	
	@Override
	public List<AnonymousReplyVO> replylist(int ano) {
		return mapper.replylist(ano);
	}
	
	@Override
	public boolean replydelete(int reno) {
		return mapper.delete(reno)>0?true:false;
	}
	
	@Override
	public String replyCheckPw(int reno) {
		return mapper.replyCheckPw(reno);
	}
}
