package com.spring.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chat.domain.ChatUserMsgrVo;
import com.spring.chat.mapper.ChatUserMsgMapper;

@Service
public class ChatUserMsgServiceImpl implements ChatUserMsgService{

	@Autowired
	private ChatUserMsgMapper mapper;

	@Override
	public List<ChatUserMsgrVo> chatList(int chatroom_num) {
		return mapper.chatList(chatroom_num);
	}

	@Override
	public int insertMsg(ChatUserMsgrVo vo) {
		return mapper.insertMsg(vo);
	}
}
