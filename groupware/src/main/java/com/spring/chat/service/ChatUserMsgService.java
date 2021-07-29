package com.spring.chat.service;

import java.util.List;

import com.spring.chat.domain.ChatUserMsgrVo;
import com.spring.member.domain.MemberVo;

public interface ChatUserMsgService {

	public List<ChatUserMsgrVo> chatList(int chatroom_num);
	public int insertMsg(ChatUserMsgrVo vo);
	public MemberVo findUserId(int eno);
}
