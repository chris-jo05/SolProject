package com.spring.chat.service;

import java.util.List;

import com.spring.chat.domain.ChatRoomVo;

public interface ChatRoomService {
	// 채팅방 생성
	public int insertChatRoom(ChatRoomVo vo);
	// 채팅방 목록 가져오기
	public List<ChatRoomVo> chatRoomList(int eno);
}
