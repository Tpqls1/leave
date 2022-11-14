package org.zerock.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.AttachVO;
import org.zerock.domain.CommentsVO;
import org.zerock.service.AttachService;
import org.zerock.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/comments/*")
@Log4j
@AllArgsConstructor
public class CommentsController {
	private CommentService service; 
	private AttachService attachService;
	
	@PostMapping("/insert")
	public String insert(CommentsVO comments, Model model) {
		log.info("insert..." + comments);
		service.insert(comments);
		Integer bno = comments.getBno();
		List<CommentsVO>commentList = service.getList(bno);
		model.addAttribute("comments",commentList);
		Integer comCnt = service.getComCount(bno);
		model.addAttribute("comCnt",comCnt);
		HashMap<Integer, String> commentsProfile = getComProfile(commentList);
		model.addAttribute("comProfile", commentsProfile);
		return "/comments/list";
	}
	
	@PostMapping("/update")
	public String update(CommentsVO comments, Model model) {
		log.info("update..." + comments);
		service.update(comments);
		Integer bno = comments.getBno();
		List<CommentsVO>commentList = service.getList(bno);
		model.addAttribute("comments",commentList);
		Integer comCnt = service.getComCount(bno);
		model.addAttribute("comCnt",comCnt);
		HashMap<Integer, String> commentsProfile = getComProfile(commentList);
		model.addAttribute("comProfile", commentsProfile);
		return "/comments/list";
	}
	
	@PostMapping("/delete")
	public String delete(CommentsVO comments, Model model) {
		log.info("delete..." + comments);
		service.delete(comments);
		Integer bno = comments.getBno();
		List<CommentsVO>commentList = service.getList(bno);
		model.addAttribute("comments",commentList);
		Integer comCnt = service.getComCount(bno);
		model.addAttribute("comCnt",comCnt);
		HashMap<Integer, String> commentsProfile = getComProfile(commentList);
		model.addAttribute("comProfile", commentsProfile);
		return "/comments/list";
	}
	
//	댓글 프로필사진
	private HashMap<Integer, String>getComProfile(List<CommentsVO> comments){
		HashMap<Integer, String> commentsProfile = new HashMap<Integer, String>();
		for(int i=0;i< comments.size();i++) {
			CommentsVO comment = comments.get(i);
			String comUserid = comment.getUserid();
			AttachVO attach = attachService.findByUserid(comUserid); 
			//	nullCheck
			if(attach != null) {
				commentsProfile.put(comment.getCno(),
						attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
			}
		}
		return commentsProfile;
	}
	
}
