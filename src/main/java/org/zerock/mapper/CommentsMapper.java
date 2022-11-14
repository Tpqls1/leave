package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CommentsVO;

public interface CommentsMapper {
//	insert, read, getBnoByUserid, delete, update, getListWithPaging, getCountByBno
	public void insert(CommentsVO comments);
	public void delete(Integer cno);
	public void deleteByBno(Integer bno);
	public CommentsVO read(Integer cno);
	public List<CommentsVO> getList(Integer bno);
	public int getCountByBno(Integer bno);
	public int update(CommentsVO comments);
//	작성한 게시글 불러오기
	public List<Integer> getBnoByUserid(String userid);
}
