package com.spring.mail.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.chat.domain.ChatUserMsgrVo;
import com.spring.chat.service.ChatUserMsgService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class MailWebSocketHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	Map<String, WebSocketSession> chatSession = new HashMap<String, WebSocketSession>();
	Map<String, WebSocketSession> mailSession = new HashMap<String, WebSocketSession>();
	
	@Autowired
	private ChatUserMsgService service;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 유저가 로그인했을때
		log.info("afterConnectionEstablished : " + session);
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		
		// 로그인 한 유저의 id
		String senderId = getId(session);
		
		log.info("로그인한 유저의 아이디 : " + senderId);
		
		mailSession.put(senderId, session);
		chatSession.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 유저가 메일을 보냈을 때
		log.info("handleTextMessage : " + session + " : " + message);
		System.out.println("handleTextMessage : " + session + " : " + message);
		
		// 로그인 한 유저의 id
		String senderId = getId(session);
		log.info(senderId + " =>>>>>> 값이 무엇인지 확인하기");
		
	
		
		//protocol : cmd, 메일보낸자(m_id), 메일 받는자(e_id), 메일 번호(m_no) 
		String msg = message.getPayload();
		log.info(msg + " >>>>>>>> msg확인해보기");
		
		if(!StringUtils.isEmpty(msg)) {
			
			String[] strs = msg.split(",");
			log.info("로그 확인하기 " + strs);
			
			if(strs != null && strs.length == 4) {
				
				String cmd = strs[0];
				log.info(cmd + "=  cmd란 무엇일까??????");
				
				String m_id = strs[1];
				log.info(m_id + "=  m_id란 무엇일까??????");
				
				String e_id = strs[2];
				log.info(e_id + "=  e_id란 무엇일까??????");
				
				String url = strs[3];
				log.info(url + "=  url란 무엇일까??????");
				
				WebSocketSession mailReceiveSession = mailSession.get(e_id);
				log.info(mailReceiveSession + " >>>>>>>>>>>>   값은 무엇이지?");
				
				if("mail".equals(cmd) &&  mailReceiveSession != null) {
					TextMessage tmpMsg = new TextMessage("<a href='/mailbox/mailMain' class=\"dropdown-item\" name='mail'> \r\n"
							+ "								<i class=\"fas fa-envelope mr-2\"></i> 새 메일이 도착했습니다.");
					log.info(tmpMsg + "의 메세지를 보낼 수 있는지");
					mailReceiveSession.sendMessage(tmpMsg);
				}
			}else if(strs != null && strs.length ==1) {
				
				String boa = strs[0];
				log.info(boa + " <><>>>>>boa값");
				log.info(sessions);
				for(WebSocketSession sess : sessions){
					log.info(sess + "sess가 되나 안되나");
					 
			        sess.sendMessage(new TextMessage("<a href='/board/boardMain' class='dropdown-item' name='board'>\r\n"
			            + "							<i class='fas fa-file mr-2'></i>새로운 공지사항" ));
			     } // for문 종료
			}else if(strs != null && strs.length == 6) {
				
				String cmd = strs[0];
				log.info("cmd : " + cmd);
				
				String chatMsg = strs[1];
				log.info("작성 내용 : " + chatMsg);
				
				String sender_name = strs[2];
				log.info("보낸 사람 이름 : " + sender_name);
				
				int receive_eno = Integer.parseInt(strs[3]);
				log.info("받는 사람 사원번호 : " + receive_eno);
				
				int chatroom_num = Integer.parseInt(strs[4]);
				log.info("채팅방 번호 : " + chatroom_num);
				
				int send_eno = Integer.parseInt(strs[5]);
				log.info("보낸 사람 사원번호 : " + send_eno);
				
				ChatUserMsgrVo vo = new ChatUserMsgrVo();
				vo.setChatroom_num(chatroom_num);
				vo.setName(sender_name);
				vo.setChat_msg(chatMsg);
				vo.setEno(send_eno);
				
				System.out.println(vo);
				
				try {
					int result = service.insertMsg(vo);
					System.out.println(result);
					
					if(result > 0) {
						
						MemberVo receive = service.findUserId(receive_eno);
						MemberVo sender = service.findUserId(send_eno);
						
						WebSocketSession chatSenderSession = chatSession.get(sender.getId());
						WebSocketSession chatReceiveSession = chatSession.get(receive.getId());
						log.info("chatSession 값을 확인해 보기 : " + chatSession);
						log.info("chatReceiveSession의 값을 확인 해보기 : " + chatReceiveSession);
						log.info("chatSenderSession의 값을 확인 해보기 : " + chatSenderSession);
						
						if("chat".equals(cmd) && chatReceiveSession != null) {
							
							if(chatSenderSession != null && chatReceiveSession != null) {
								TextMessage chatMessage = new TextMessage(cmd +","+chatMsg+","+sender_name+","+receive.getEname()+","+chatroom_num);
								
								log.info("보내는 사람에게 보내지는 메세지 : " + chatMessage);
								log.info("받는 사람에게 보낼 메세지 : " + chatMessage);
								chatSenderSession.sendMessage(chatMessage);
								chatReceiveSession.sendMessage(chatMessage);
								
							}
						}
						
					} // if(result)문 종료
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
			}
			// else if문 종료
		}
		
	}
	
	
	
	private String getId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		log.info(httpSession + "값은 ?");
		MemberVo member =  (MemberVo)httpSession.get("login");
		log.info(member.getId());
		
		if(null == member) {
			return session.getId();
		}else {
			return member.getId();
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 유저가 로그아웃 했을 때
		log.info("afterConnectionClosed : " + session + " : " + status);
		System.out.println("afterConnectionClosed : " + session + " : " + status);
		String senderId = getId(session);
		
		sessions.remove(session);
		mailSession.remove(senderId, session);
		chatSession.remove(senderId, session);
	}
	
}
