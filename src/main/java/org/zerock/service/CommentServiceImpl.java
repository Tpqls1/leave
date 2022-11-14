package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.CommentsVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.CommentsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {
	private CommentsMapper mapper;
	private BoardMapper boardMapper;
	
	@Override
	public void insert(CommentsVO comments) {
		mapper.insert(comments);
		Integer bno = comments.getBno();
		boardMapper.increaseComCnt(bno);
	}

	@Override
	public List<CommentsVO> getList(Integer bno) {
		log.info("getList...");
		return mapper.getList(bno);
	}

	@Override
	public int getComCount(Integer bno) {
		return boardMapper.getComCount(bno);
	}

	@Override
	public CommentsVO read(Integer cno) {
		return mapper.read(cno);
	}

	@Override
	public void update(CommentsVO comments) {
		mapper.update(comments);
	}

	@Override
	public void delete(CommentsVO comments) {
		Integer cno = comments.getCno();
		mapper.delete(cno);
		Integer bno = comments.getBno();
		boardMapper.decreaseComCnt(bno);
	}

	@Override
	public List<Integer> getBnoByUserid(String userid) {
		return mapper.getBnoByUserid(userid);
	}
}
