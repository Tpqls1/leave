package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardCatVO;

public interface BoardCatMapper {
	public List<BoardCatVO> readByBno(Integer bno);
	public void insert(BoardCatVO boardCat);
	public void delete(Integer bno);
	public void updateByBno(BoardCatVO boardCat);
	public Integer getBnoByCatNo(Integer catno);
	public Integer getCatNoByBno(Integer bno);
}
