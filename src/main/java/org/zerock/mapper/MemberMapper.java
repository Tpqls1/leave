package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);

	// 회원가입 추가
	public void insert(MemberVO member);

	// 회원정보 수정
	public int update(MemberVO member);

	// 회원정보 조회 
	public MemberVO info(String userid);
	
	// 회원정보 삭제 
	public int delete(String userid);

	public List<MemberVO> getList();	// 모든 게시글 목록을 가져오는 메소드
	public List<MemberVO> getListWithPaging(Criteria cri);	// 해당 페이지의 게시글 목록 가져오기
	public int getTotalCount(Criteria cri);	// 검색 조건에 따른 게시글

}