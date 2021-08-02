package com.spring.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chat.domain.ChatRoomVo;
import com.spring.chat.mapper.ChatUserMsgMapper;
import com.spring.chat.mapper.ChatRoomMapper;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	@Autowired
	private ChatRoomMapper roomMapper;
	@Autowired
	private ChatUserMsgMapper memberMapper;
	
	@Override
	public int insertChatRoom(ChatRoomVo vo) {
		return roomMapper.insertChatRoom(vo);
	}

	@Override
	public List<ChatRoomVo> chatRoomList(int eno) {
		return roomMapper.chatRoomList(eno);
	}

}
