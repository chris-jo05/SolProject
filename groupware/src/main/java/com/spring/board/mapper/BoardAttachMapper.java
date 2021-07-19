package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.AttachFileDTO;

public interface BoardAttachMapper {
	public int insert(AttachFileDTO attach);
	public int delete(int bno);
	public List<AttachFileDTO> findByBno(int bno);
	public List<AttachFileDTO> getOldFiles();
}
