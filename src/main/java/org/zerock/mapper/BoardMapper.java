package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
//	게시글, 첨부파일, 게시글_카테고리, 해시태그, 게시글_해시태그
	public List<BoardVO> getList();
	public List<BoardVO> getListByHashTag(String tagName);
	
	public List<BoardVO> getListWithPaging(Criteria cri);	// 해당 페이지의 게시글 목록 가져오기
	public List<BoardVO> getListWithPagingByCatNo(@Param("cri") Criteria cri, @Param("catno") Integer catno);
	
	public int getTotalCount(Criteria cri);	// 검색 조건에 따른 게시글
	public int getTotalCountByCatNo(@Param("cri") Criteria cri, @Param("catno") Integer catno);	// 검색 조건에 따른 게시글(카테고리별)
	public int getTotalCountByTagNo(Criteria cri, Integer tagno);	// 검색 조건에 따른 게시글(해시태그별)
	public int getTotal();	
	public Integer getMaxBno();
	public int getComCount(Integer bno);
	public int getLikeCount(Integer bno);
	
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(Integer bno);
	public int update(BoardVO board);
	public int delete(Integer bno);
	public void increaseLikeCnt(Integer bno);
	public void decreaseLikeCnt(Integer bno);
	public void increaseComCnt(Integer bno);
	public void decreaseComCnt(Integer bno);
	public List<BoardVO> getListByCatList(Map<String,List<BoardCatVO>> categories);
	public List<BoardVO> readByUserid(String userid);
	public int getCountByUserid(String userid);
}
