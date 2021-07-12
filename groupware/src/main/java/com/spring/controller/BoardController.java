package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
import com.spring.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/boardMain")
	public void main(Model model,Criteria cri) {
		log.info("공지사항 페이지로 이동합니다.");
		
		List<BoardVO> list = service.list(cri);
		int total = service.total(cri);
		
		
		model.addAttribute("list", list);
		//페이지 나누기
		model.addAttribute("pageVO",new PageVO(cri, total));
	}

	@GetMapping({ "/boardRead", "/boardModify" })
	public void read(int bno, Model model) {
		log.info(bno + "번의 공지사항을 읽습니다");
		BoardVO vo = service.read(bno);
		model.addAttribute("vo", vo); // /board/read or /board/modify
	}
	
	

	@GetMapping("/boardWriter")
	public void writer() {
		log.info("공지사항 작성 페이지로 이동합니다.");
	}

	// 게시글 등록
	@PostMapping("/boardWriter")
	public String writerPost(BoardVO vo, RedirectAttributes rttr) {
		log.info("공지사항 작성을 요청합니다");

		if (service.insert(vo)) {
			rttr.addFlashAttribute("result", vo.getBno());
			return "redirect:boardMain"; // redirect:/board/boardMain
		} else {
			return "redirect:boardWriter"; // redirect:/board/boardWriter
		}

	}


	@GetMapping("/boardRemove")
	public String remove(int bno,RedirectAttributes rttr) {
		log.info("삭제를 요청합니다.");
		
		if(service.delete(bno)) {
			return "redirect:/board/boardMain";
		}else {
			
			return "redirect:/";
		}

	}

}