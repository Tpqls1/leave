package org.zerock.service;

import java.util.List;

import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;

public interface AttachService {
	public void insert(BoardVO board);
	public void deleteFiles(List<AttachVO> attachList);
	public List<AttachVO> getThumbnail();
}
