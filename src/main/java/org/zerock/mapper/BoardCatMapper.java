package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;

public interface BoardCatMapper {
	public List<BoardCatVO> readByBno(BoardVO board);
	public void insert(BoardCatVO boardCat);
	public void delete(Integer bno);
	public void updateByBno(BoardCatVO boardCat);
}
