package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private Integer cno;
	private Integer bno;
	private String userid;
	private String comment;
	private String nickname;
	private Date comDate;
}
