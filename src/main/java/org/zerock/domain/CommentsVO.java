package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private int cno;
	private int bno;
	private String commenter;
	private String comment;
	private int parent;
	private Date comDate;
}
