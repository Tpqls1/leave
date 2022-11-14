package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;

public interface AttachMapper {
	public void insert(AttachVO attach);
	
	public int delete(String uuid);
	
	public List<AttachVO> getAttachList(Integer bno);
	// 특정 게시글의 첨부파일(전체)

	public List<AttachVO> findByBno(Integer bno);
	// 특정 게시글의 첨부파일(썸네일제외)

	public AttachVO findByUserid(String userid);
	// 특정 사용자의 프로필사진
	
	public void deleteAll(Integer bno);
	// 전일의 첨부파일 목록을 가져온다.

	public void deleteByUserid(String userid);

	public List<AttachVO> getThumbnail();

	public AttachVO getThumbnailByBno(Integer bno);

	public List<AttachVO> getOldFiles();
}	// 파일에서는 update = delete -> insert



