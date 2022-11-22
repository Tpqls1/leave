package org.zerock.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

// 로그인할 때 비밀번호 암호화를 적용해야 하는데, 적용하지 않토록 하는 패스워드 인코더를 추가
@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		log.info("before encode : " + rawPassword);
		return rawPassword.toString();
	}
	
	// 브라우저로부터 올라온 비밀번호와 데이터베이스에 저장된 비밀번호를 비교
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.warn("matches: " + rawPassword + ":" + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
}
