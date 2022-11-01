package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String userid;
	private Date regDate;	
	private int likeCnt;	//	좋아요 수
	private int comCnt;		//	댓글 수 

	// 첨부파일 목록을 추가
	private List<AttachVO> attachList;
	// 해시태그 목록을 추가 
	private List<TagVO> tagList;
	// 카테고리 목록을 추가
	private List<BoardCatVO> catList;
}
