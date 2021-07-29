package com.spring.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.chat.domain.ChatRoomVo;
import com.spring.chat.domain.ChatUserMsgrVo;
import com.spring.chat.service.ChatRoomService;
import com.spring.chat.service.ChatUserMsgService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ChatController {

	@Autowired
	private ChatRoomService service;
	@Autowired
	private ChatUserMsgService userService;
	
	@GetMapping("/insertChatRoom")
	public String insertChatRoom(String receiver_name,int receive_eno,HttpSession session) {
		
		MemberVo member = (MemberVo)session.getAttribute("login");
		
		System.out.println(receiver_name);
		System.out.println(receive_eno);
		
		ChatRoomVo vo = new ChatRoomVo();
		
		vo.setReceiver_name(receiver_name);
		vo.setReceive_eno(receive_eno);
		
		vo.setSender_name(member.getEname());
		vo.setSend_eno(member.getEno());
		
		log.info("채팅방을 생성합니다 " +vo);
		int result = service.insertChatRoom(vo);
		
		if(result > 0) {
			return "redirect: /main/home";
		}else {
			return "redirect: teamViewHr";
		}
	}
	
	@GetMapping("/chatRoomList")
	public ResponseEntity<List<ChatRoomVo>> chatRoomList(HttpSession session) {
		
		MemberVo vo = (MemberVo)session.getAttribute("login");
		
		log.info("채팅방 목록을 가져옵니다 " + vo.getEno());
		
		return new ResponseEntity<List<ChatRoomVo>>(service.chatRoomList(vo.getEno()),HttpStatus.OK);
	}
	
	@GetMapping("/chatRoom/{chatroom_num}")
	public ResponseEntity<List<ChatUserMsgrVo>> chatList(@PathVariable("chatroom_num")int chatroom_num){
		log.info(chatroom_num + "번 방의 대화창에 들어갑니다.");
		
		return new ResponseEntity<List<ChatUserMsgrVo>>(userService.chatList(chatroom_num), HttpStatus.OK);
	}
	
	
}
