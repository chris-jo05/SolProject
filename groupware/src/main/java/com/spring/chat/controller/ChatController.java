package com.spring.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.chat.service.ChatRoomService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ChatController {

	@Autowired
	private ChatRoomService service;
	
	@GetMapping("/insertChatRoom")
	public String insertChatRoom(String receiver_name,HttpSession session) {
		
		MemberVo member = (MemberVo)session.getAttribute("login");
		log.info("채팅방을 생성합니다 " +member.getId() + " , " + receiver_name);
		int result = service.insertChatRoom(member.getEname(), receiver_name);
		
		if(result > 0) {
			return "redirect: /main/home";
		}else {
			return "redirect: teamViewHr";
		}
		
	}
}
