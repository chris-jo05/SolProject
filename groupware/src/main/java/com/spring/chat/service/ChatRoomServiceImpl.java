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
	public int insertChatRoom(String sender_name, String receiver_name) {
		return roomMapper.insertChatRoom(sender_name, receiver_name);
	}

	@Override
	public List<ChatRoomVo> chatRoomList(String sender_name) {
		return roomMapper.chatRoomList(sender_name);
	}

}
