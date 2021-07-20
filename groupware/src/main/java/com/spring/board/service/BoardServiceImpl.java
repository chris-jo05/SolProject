package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.AttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;
import com.spring.board.mapper.BoardAttachMapper;
import com.spring.board.mapper.BoardMapper;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public boolean insert(BoardVO vo) {
		//새 개시글 등록
		boolean result=mapper.insert(vo)>0?true:false;
		//첨부파일 등록
		if(vo.getAttachList()==null||vo.getAttachList().size()<=0) {
			return result;
		}
		
		vo.getAttachList().forEach(attach->{
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});

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
	@Transactional
	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		//첨부 파일 삭제
		attachMapper.delete(bno);
		//게시글 삭제
		return mapper.delete(bno)>0?true:false;
	}

	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalBn(cri);
	}
	@Transactional
	@Override
	public boolean update(BoardVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		attachMapper.delete(vo.getBno());
		//게시글 수정
		boolean modifyResult = mapper.update(vo)>0?true:false;
		if(vo.getAttachList()==null) {
			return modifyResult;
		}
		//첨부파일 삽입
		if(modifyResult &&vo.getAttachList().size()>0) {
			for(AttachFileDTO dvo:vo.getAttachList()) {
				dvo.setBno(vo.getBno());
				attachMapper.insert(dvo);
			}
		}
		
		return modifyResult;
	}

	@Override
	public boolean hit(int bno) {
		// TODO Auto-generated method stub
		return mapper.hit(bno)>0?true:false;
	}

	@Override
	public List<AttachFileDTO> getAttachList(int bno) {
		// TODO Auto-generated method stub
		return attachMapper.findByBno(bno);
	}

	@Override
	public int totalBsr(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.totalBsr(cri);
	}


}
