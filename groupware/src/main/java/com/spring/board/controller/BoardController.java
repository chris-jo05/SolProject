package com.spring.board.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.AttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.PageVO;
import com.spring.board.service.BoardService;
import com.spring.member.domain.MemberVo;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/boardMain")
	public void main(Model model, Criteria cri) {
		log.info("공지사항 페이지로 이동합니다.");

		/*
		 * List<BoardVO> list = service.list(cri); int total = service.total(cri);
		 * 
		 * model.addAttribute("list", list); // 페이지 나누기 model.addAttribute("pageVO", new
		 * PageVO(cri, total));
		 */

		
		  if(cri.getKeyword() == null) { 
		  List<BoardVO> list = service.list(cri); 
		  int total = service.total(cri); 
		  model.addAttribute("list", list);
		  
		  model.addAttribute("pageVO",new PageVO(cri, total)); 
		  } 
		  else {
		  
		  List<BoardVO> list = service.list(cri); 
		  int total = service.totalBsr(cri);
		  log.info("토탈 : " + total);
		  model.addAttribute("list", list); 
		  model.addAttribute("pageVO",new PageVO(cri,total));
		 
		  }
		 
	}

	@PostMapping("/check")
	@ResponseBody
	public int check(HttpServletRequest req, HttpSession session) {
		log.info("권한 체크");
		MemberVo login = (MemberVo) session.getAttribute("login");
		String id = req.getParameter("id");

		if (id.equals(login.getEname())) {
			return 1;
		} else {
			return 0;
		}
	}

	@GetMapping({ "/boardRead", "/boardModify" })
	public void read(int bno, @ModelAttribute("cri") Criteria cri, Model model,BoardVO bvo) {
		log.info(bno + "번의 공지사항을 읽습니다" + "cri:" + cri);
		BoardVO vo = service.read(bno);
		// 조회수 올려주기
		service.hit(bno);
		model.addAttribute("BoardVO",bvo);
		model.addAttribute("vo", vo); // /board/read or /board/modify
		
	}

	@PostMapping("/boardModify")
	public String update(BoardVO vo, Criteria cri, RedirectAttributes rttr, HttpSession session) {
		log.info("수정작업 요청");

		// 첨부파일 확인
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info("" + attach));
		}
		service.update(vo);

		rttr.addFlashAttribute("result", "성공");

		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:boardMain";
	}

	@GetMapping("/boardWriter")
	public void writer() {
		log.info("공지사항 작성 페이지로 이동합니다.");
	}

	// 게시글 등록
	@PostMapping("/boardWriter")
	public String writerPost(BoardVO vo, RedirectAttributes rttr) {
		// 첨부파일 확인
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info("" + attach));
		}

		if (service.insert(vo)) {
			rttr.addFlashAttribute("result", vo.getBno());
			return "redirect:boardMain"; // redirect:/board/boardMain
		} else {
			return "redirect:boardWriter"; // redirect:/board/boardWriter
		}

	}

	// 삭제
	@GetMapping("/boardRemove")
	public String remove(int bno, RedirectAttributes rttr) {
		log.info("삭제를 요청합니다.");
		List<AttachFileDTO> attachList = service.getAttachList(bno);

		//게시글 삭제 + 첨부파일 삭제
		if(service.delete(bno)) {
		//2) 폴더 파일 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","성공");
		
	}
		return "redirect:boardMain";

	}

	// 첨부물 가져오기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachFileDTO>> getAttachList(int bno) {
		log.info("첨부물 가져오기" + bno);

		return new ResponseEntity<List<AttachFileDTO>>(service.getAttachList(bno), HttpStatus.OK);

	}
	private void deleteFiles(List<AttachFileDTO> attachList) {
		log.info("첨부 파일 삭제 "+attachList);
		
		if(attachList==null||attachList.size()<=0) {
			return;
		}
		for(AttachFileDTO dto:attachList) {
			Path path = Paths.get("d:\\upload\\", dto.getUploadPath()+"\\"+dto.getUuid()+"_"+dto.getFileName());
			
			try {
				Files.deleteIfExists(path);
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumbnail = Paths.get("d:\\upload\\",
							dto.getUploadPath()+"\\s_"+dto.getUuid()+"_"+dto.getFileName());
							Files.delete(thumbnail);
				}
			} catch (IOException e) {
			e.printStackTrace();
			}
				
			}
		}

}