package com.spring.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.chat.domain.ChatRoomVo;

public interface ChatRoomMapper {
	// 채팅방 생성
	public int insertChatRoom(ChatRoomVo vo);
	// 채팅방 목록 가져오기
	public List<ChatRoomVo> chatRoomList(int send_eno);
}
