package org.zerock.service;

import java.util.List;

import org.zerock.domain.CommentsVO;

public interface CommentService {
	public void insert(CommentsVO comments);
	public void update(CommentsVO comments);
	public void delete(CommentsVO comments);
	public List<CommentsVO> getList(Integer bno);
	public int getComCount(Integer bno);
	public CommentsVO read(Integer cno);
	public List<Integer> getBnoByUserid(String userid);
}
