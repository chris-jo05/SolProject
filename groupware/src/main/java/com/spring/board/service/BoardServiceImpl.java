package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;
import com.spring.board.mapper.BoardMapper;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public boolean insert(BoardVO vo) {
		boolean result=mapper.insert(vo)>0?true:false;
		return result;
	}

	@Override
	public List<BoardVO> list(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.list(cri);
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}

	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno)>0?true:false;
	}

	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalBn(cri);
	}

	@Override
	public boolean update(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo)>0?true:false;
	}

	@Override
	public boolean hit(int bno) {
		// TODO Auto-generated method stub
		return mapper.hit(bno)>0?true:false;
	}


}