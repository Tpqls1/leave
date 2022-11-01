package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;

public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	public void insert(BoardVO board);
	public List<AttachVO> getAttachList(Integer bno);
	public boolean delete(Integer bno);
	public boolean update(BoardVO board);
	public BoardVO read(Integer bno);

	public Integer getMaxBno();	

	public int getTotalCount(Criteria cri);	// 검색 조건에 따른 게시글
	public int getTotalCountByCatNo(Criteria cri, Integer catno);	// 검색 조건에 따른 게시글(카테고리별)
	public int getTotalCountByTagNo(Criteria cri, Integer tagno);	// 검색 조건에 따른 게시글(해시태그별)
	
	public List<BoardVO> getListWithPagingByCatNo(Criteria cri, Integer catno);	// 해당 페이지의 게시글 목록 가져오기
	
	public void updateReplyCnt(@Param("bno") Integer bno, @Param("amount") int amount);	//	댓글 수 
	
	public void insertLike(LikeVO like);
	public List<BoardCatVO> getCatByBno(BoardVO board);
}
