package org.zerock.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.AttachMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AttachServiceImpl implements AttachService {
	private AttachMapper attachMapper;

	@Override
	public void insert(BoardVO board) {
//		BoardVO 의 AttachList(첨부파일목록)이 비어있지 않으면.. -> 
			if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
				return;
			}
			//  -> 첨부 파일 정보를 데이터베이스에 저장
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attach.setAttachType(attach.isAttachType());
				attach.setThumbnail(attach.isThumbnail());
				attachMapper.insert(attach);
			});
	}
	
	@Override
	public void insertProfile(AttachVO attach) {
		attachMapper.insert(attach);
		log.info("profileAttach: "+ attach);
	}
		@Override
	public void deleteFiles(List<AttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
		      return;
		}
		log.info("delete attach files...................");
		log.info(attachList);
		attachList.forEach(attach -> {
		try {
				Path file  = Paths.get("/Users/tpqls/upload/"+attach.getUploadPath()+"/" + attach.getUuid()+"_"+ attach.getFileName());
		        Files.deleteIfExists(file);
		        Path thumbNail = Paths.get("/Users/tpqls/upload/"+attach.getUploadPath()+"/s_" + attach.getUuid()+"_"+ attach.getFileName());
		        Files.delete(thumbNail);
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end forEach
	}

	@Override
	public List<AttachVO> getThumbnail() {
		return attachMapper.getThumbnail();
	}

	@Override
	public AttachVO getThumbnailByBno(Integer bno) {
		return attachMapper.getThumbnailByBno(bno);
	}

	@Override
	public List<AttachVO> findByBno(Integer bno) {
		return attachMapper.findByBno(bno);
	}

	@Override
	public AttachVO findByUserid(String userid) {
		return attachMapper.findByUserid(userid);
	}

	@Override
	public void deleteByUserid(String userid) {
		attachMapper.deleteByUserid(userid);
	}
}
