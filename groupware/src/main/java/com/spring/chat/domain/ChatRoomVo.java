package com.spring.chat.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomVo {
	private int chatroom_num;
	private String sender_name;
	private String receiver_name;
	
	private ChatMemberVo member;
}
