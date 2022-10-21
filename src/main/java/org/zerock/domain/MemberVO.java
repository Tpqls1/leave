package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String pw;
	private String username;
	private String nickname;
	private String email;
	private String phone;
	private String addr;
	private String detAddr;
	private String postCode;	//	우편번호
	private String birth_date;	
	private String gender;
	private Date regDate;		//	회원가입일 <- 정렬기준
	private Integer grade; 
	private boolean enabled;
}
