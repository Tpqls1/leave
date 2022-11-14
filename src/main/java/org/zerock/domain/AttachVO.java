package org.zerock.domain;

import lombok.Data;

@Data
public class AttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private Integer bno;
	private String userid;
	private boolean attachType;
	private boolean thumbnail;
	private Integer ano;
}
