package com.spring.chat.domain;

import java.util.Date;

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
public class ChatMemberVo {
	private int chatroom_num;
    private String sender_name;
    private String receiver_name;
    private Date send_date;
    private String chat_msg;
    private boolean read_val; 
}
