package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;
import org.zerock.domain.TagVO;

public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO> getListByHashTag(String tagName);
	public void insert(BoardVO board);
	public List<AttachVO> getAttachList(Integer bno);
	public boolean delete(Integer bno);
	public boolean update(BoardVO board);
	public BoardVO read(Integer bno);

	public Integer getLikeCnt(Integer bno);
	
	public Integer getMaxBno();	
	public List<TagVO> getTagByBno(Integer bno); 

	public int getTotal();	// 전체 게시글
	public int getTotalCount(Criteria cri);	// 검색 조건에 따른 게시글
	public int getTotalCountByCatNo(Criteria cri, Integer catno);	// 검색 조건에 따른 게시글(카테고리별)
	public int getTotalCountByTagNo(Criteria cri, Integer tagno);	// 검색 조건에 따른 게시글(해시태그별)
	
	public List<BoardVO> getListWithPagingByCatNo(Criteria cri, Integer catno);	// 해당 페이지의 게시글 목록 가져오기
	
	
	public int insertLike(LikeVO like);
	public List<BoardCatVO> getCatByBno(Integer bno);
	public Integer getBnoByCatNo(Integer catno);
	
	public List<BoardVO> getListByCatList(List<BoardCatVO> categories);
	public List<BoardVO> readByUserid(String userid);
	public List<LikeVO> getLikeByUserid(String userid);
	public Integer getLike(LikeVO like);
	public int getCountByUserid(String userid);
}
