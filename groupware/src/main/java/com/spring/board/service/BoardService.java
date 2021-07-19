package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.AttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;


public interface BoardService {
	public boolean insert(BoardVO vo);
	public List<BoardVO> list(Criteria cri);
	public BoardVO read(int bno);
	public boolean delete(int bno);
	public int total(Criteria cri);
	public boolean update(BoardVO vo);
	public boolean hit(int bno);

	public List<AttachFileDTO> getAttachList(int bno);
}
