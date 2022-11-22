package org.zerock.service;

import java.util.List;

import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.TagVO;

public interface AdminService {
	// 게시글 목록 보기
//	public List<BoardVO> getList();
	public List<MemberVO> getMemberList(Criteria cri);	// 페이징 처리
	
	public List<BoardVO> getList(Criteria cri);	
	
	public int getTotalCount(Criteria cri);
	
	
	// 상세 보기
	public BoardVO get(Integer bno);
	
	public MemberVO get(String userid);

	public List<TagVO> getTag(Integer bno);
	
	// 게시글 삭제
	public boolean remove(Integer bno);
	
	public boolean remove(String userid);
	
	
	// 첨부 파일 목록 가져오는 메소드
	public List<AttachVO> getAttachList(Integer bno);

}
