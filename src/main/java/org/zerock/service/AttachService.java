package org.zerock.service;

import java.util.List;

import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;

public interface AttachService {
	public void insert(BoardVO board);
	public void insertProfile(AttachVO attach);
	public void deleteByUserid(String userid);
	public void deleteFiles(List<AttachVO> attachList);
	public List<AttachVO> getThumbnail();
	public AttachVO getThumbnailByBno(Integer bno);
	public List<AttachVO> findByBno(Integer bno);
	public AttachVO findByUserid(String userid);
}
