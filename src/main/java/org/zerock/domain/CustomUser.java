package org.zerock.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

// User : UserDetails 인터페이스를 구현한 추상클래스이다.
// CustomerUser 클래스가 UserDetails 인터페이스르 구현한 셈이 된다.
// UserDetails 인터페이스 : 사용자 프로파일에 접근할 수 있는 메소드를 제공
@Getter
public class CustomUser extends User {
private static final long serialVersionUID = 1L;
	
	private MemberVO member;

	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(MemberVO vo) {
		super(vo.getUserid(), vo.getPw(), vo.getAuthList().stream()
			.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
}
