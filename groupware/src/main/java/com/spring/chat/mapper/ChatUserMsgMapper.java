package com.spring.chat.mapper;

import java.util.List;

import com.spring.chat.domain.ChatUserMsgrVo;

public interface ChatUserMsgMapper {
	// 채팅방의 번호를 받아 모든 채팅을 가져온다.
	public List<ChatUserMsgrVo> chatList(int chatroom_num);
	
	// 메세지 보내기
	public int insertMsg(ChatUserMsgrVo vo);
}
