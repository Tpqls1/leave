package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;
import org.zerock.mapper.AttachMapper;
import org.zerock.mapper.BoardCatMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.CommentsMapper;
import org.zerock.mapper.LikeMapper;
import org.zerock.mapper.TagMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	
	//	게시글 삭제 시 해당 bno 전체삭제 
	private LikeMapper likeMapper;
	private CommentsMapper commentsMapper;
	//	카테고리
	private BoardCatMapper catMapper;
	//	첨부파일
	private AttachMapper attachMapper;
	//	해시태그
	private TagMapper tagMapper;
	
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount...");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<AttachVO> getAttachList(Integer bno) {
		log.info("getAttachList...");
		return attachMapper.findByBno(bno);
	}

	@Transactional
	@Override
	public void insert(BoardVO board) {
		log.info("insert..." + board);	// 로그를 남김
		mapper.insertSelectKey(board);	// 확장성을 위해 : 댓글, 첨부 파일
		//	카테고리 정보를 데이터베이스에 저장
		if(board.getCatList() != null && board.getCatList().size() > 0) {
			board.getCatList().forEach(cat -> {
				cat.setBno(board.getBno());
				catMapper.insert(cat);
			});
		}
		//	해시태그 정보를 데이터베이스에 저장
		if(board.getTagList() != null && board.getTagList().size() > 0) {
			board.getTagList().forEach(tag -> {
				tag.setBno(board.getBno());
				tagMapper.insertTag(tag);
			});
		}
	}
//	게시글 삭제
	@Transactional
	@Override
	public boolean delete(Integer bno) {
		log.info("delete..." + bno);
		likeMapper.deleteByBno(bno);
		tagMapper.deleteTag(bno);
		commentsMapper.deleteByBno(bno);
		catMapper.delete(bno);
		return mapper.delete(bno) > 0;
	}
//	게시글 수정
	@Transactional
	@Override
	public boolean update(BoardVO board) {
		log.info("update..." + board);
		attachMapper.deleteAll(board.getBno());
		tagMapper.deleteTag(board.getBno());
		catMapper.delete(board.getBno());
		
		boolean updateResult = mapper.update(board) == 1;
		if(updateResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> { 
				attach.setBno(board.getBno()); 
				attachMapper.insert(attach);
			}); 
		}
		if(board.getTagList() != null && board.getTagList().size() > 0) {
			board.getTagList().forEach(tag -> {
				tag.setBno(board.getBno());
				tagMapper.insertTag(tag);
			});
		}
		if(board.getCatList() != null && board.getCatList().size() > 0) {
			board.getCatList().forEach(cat -> {
				cat.setBno(board.getBno());
				catMapper.insert(cat);
			});
		}
		return updateResult;
	}
//	게시글 상세 
	@Override
	public BoardVO read(Integer bno) {
		log.info("read..." + bno);
		return mapper.read(bno);
	}

//	총 게시글 수(카테고리별)
	@Override
	public int getTotalCountByCatNo(Criteria cri, Integer catno) {
		log.info("getTotalCountByCatNo" + catno);
		return mapper.getTotalCountByCatNo(cri, catno);
	}
//	총 게시글 수(해시태그별) 
	@Override
	public int getTotalCountByTagNo(Criteria cri, Integer tagno) {
		log.info("getTotalCountByTagNo" + tagno);
		return mapper.getTotalCountByTagNo(cri, tagno);
	}

	@Override
	public List<BoardVO> getListWithPagingByCatNo(Criteria cri, Integer catno) {
		log.info("getListWithPagingByCatno..." + cri + ", catno: " + catno);
		return mapper.getListWithPagingByCatNo(cri, catno);
	}

//	댓글 수 
	@Override
	public void updateReplyCnt(Integer bno, int amount) {
		log.info("updateReplyCnt...bno: "+ bno + ", amount: " + amount);
		mapper.updateReplyCnt(bno, amount);
	}

//	좋아요(좋아요 버튼 클릭 -> 좋아요테이블 저장 게시글likeCnt 1증가
//	해당 userid좋아요 있을 시 삭제, 게시글likeCnt 1감소) 
	@Transactional
	@Override
	public void insertLike(LikeVO like) {
		log.info("insertLike..." + like);
		String userid = like.getUserid();
		if(likeMapper.getUserid(userid) != null || likeMapper.getUserid(userid).size() > 0) {
			likeMapper.deleteByBno(like.getBno());
			mapper.decreaseLikeCnt();
		}else {
			likeMapper.insertLike(like);
			mapper.increaseLikeCnt();
		}
	}

	//
	@Override
	public Integer getMaxBno() {
		return mapper.getMaxBno();
	}

	@Override
	public List<BoardCatVO> getCatByBno(BoardVO board) {
		return catMapper.readByBno(board);
	}
	
}
