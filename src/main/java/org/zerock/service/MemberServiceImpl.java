package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberAuthMapper;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private MemberAuthMapper authMapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Transactional
	@Override
	public void join(MemberVO member) {
		log.info("MemberService:join()");

		String encPw = pwencoder.encode(member.getPw());
		member.setPw(encPw);

		mapper.insert(member);
		// 디폴트로 ROLE_USER 부여 : 추후 권한 부여에 대한 기능 검토 필요
		AuthVO auth = new AuthVO();
		auth.setUserid(member.getUserid());
		auth.setAuth("ROLE_USER");
		authMapper.insert(auth);
	}

//	@Override
//	public List<MemberVO> getList(Criteria cri) {	// 페이징 처리
//		log.info("getListWithPaging..." + cri);
//		return mapper.getListWithPaging(cri);
//	}

	// 회원 정보
	@Override
	public MemberVO info(String userid) {
		log.info("info... " + userid);
		return mapper.read(userid);
	}

	@Override
	public boolean update(MemberVO member) {
		log.info("update......" + member);
		return mapper.update(member) == 1;
	}
	
	
	@Override
	public boolean delete(String userid) {
		log.info("delete......" + userid);
		return mapper.delete(userid) == 1;
	}
	
	@Override
	public List<MemberVO> getList(Criteria cri) {	// 페이징 처리
		log.info("getListWithPaging..." + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount..." + cri);
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public MemberVO get(String userid) {
		log.info("get... " + userid);
		return mapper.read(userid);
	}


}
