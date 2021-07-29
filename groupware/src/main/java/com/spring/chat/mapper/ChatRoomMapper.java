package com.spring.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.chat.domain.ChatRoomVo;

public interface ChatRoomMapper {
	// 채팅방 생성
	public int insertChatRoom(@Param("sender_name") String sender_name, @Param("receiver_name")String receiver_name);
	// 채팅방 목록 가져오기
	public List<ChatRoomVo> chatRoomList(String sender_name);
}
