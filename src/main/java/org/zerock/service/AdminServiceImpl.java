package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.TagVO;
import org.zerock.mapper.AttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.MemberAuthMapper;
import org.zerock.mapper.MemberMapper;
import org.zerock.mapper.TagMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service // Controller에 주입을 해주어야 하므로 주입 대상이 된다고 알려주어야 한다.
@Log4j
@AllArgsConstructor // 필드에 대한 생성자를 자동으로 추가한다.
public class AdminServiceImpl implements AdminService {
	// BoardMapper를 사용해서 데이터베이스 연동을 해야 한다.
	// BoardMapper를 주입을 받아야 한다. -> 생성자에 의하여 주입
	@Setter(onMethod_ = { @Autowired })
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberAuthMapper authMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private AttachMapper attachMapper;

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper membermapper;

	@Setter(onMethod_ = {@Autowired})
	private TagMapper tagMapper;

	@Override
	public List<BoardVO> getList(Criteria cri) { // 페이징 처리
		log.info("getListWithPaging..." + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) { // 페이징 처리
		log.info("getListWithPaging..." + cri);
		return membermapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Integer bno) {
		log.info("get... " + bno);
		return mapper.read(bno);
	}

	@Override
	public MemberVO get(String userid) {
		log.info("get... " + userid);
		return membermapper.read(userid);
	}

	// 첨부파일에 대하여 삭제하지 않았다. -> 배치작업으로 진행
	// 삭제도 가능 -> 검토가 필요
	// 기존 데이터베이스의 첨부파일 정보와 올라온 첨부파일 정보를 빼면 삭제된 첨부파일 정보가 되고
	// 차집합을 삭제하면 될 것 같다.

	@Transactional
	@Override
	public boolean remove(Integer bno) {
		log.info("remove... " + bno);
		return mapper.delete(bno) == 1; // 삭제 여부를 반환
	}

	@Transactional
	@Override
	public boolean remove(String userid) {
		log.info("remove... " + userid);
		authMapper.delete(userid);
		return membermapper.delete(userid) == 1; // 삭제 여부를 반환
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount..." + cri);
		return membermapper.getTotalCount(cri);
	}

	@Override
	public List<AttachVO> getAttachList(Integer bno) {
		log.info("get Attach list by bno " + bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	public List<TagVO> getTag(Integer bno) {
		return tagMapper.readTagByBno(bno);
	}

}
