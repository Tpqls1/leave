package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String userid;
	private Date regDate;	
	private int likeCnt;	//	좋아요 
	private int catno;		//	categori_number
	private int comCnt;		//	댓글 수 
}
