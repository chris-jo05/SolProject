package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;


public interface BoardMapper {
	public int insert(BoardVO vo);
	public int delete(int bno);
	public int update(BoardVO vo);
	public List<BoardVO> list(Criteria cri);
	public BoardVO read(int bno);
	public int totalBn(Criteria cri);
	public int hit(int bno);
	/* public int update(); */

}