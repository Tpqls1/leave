package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.AttachService;
import org.zerock.service.BoardService;
import org.zerock.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@PreAuthorize("isAuthenticated()")
@Controller // Controller로서 동작을 한다고 스프링에게 알린다.
@RequestMapping("/my/*") // /board 라는 url을 사용한다고 설정
@Log4j
@AllArgsConstructor
public class MyBoardController {
	// BoardService를 주입 받는다.(생성자로 주입)
	private BoardService service;
	private AttachService attachService;
	private CommentService commentService;
	
	
	//	작성 게시글
	@GetMapping("/list")
	public void list(String userid, Criteria cri, Model model) {
		List<BoardVO> list = service.readByUserid(userid);
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			fileCallPath.put(thumb.getBno(),	//	bno를 key로 설정
					thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
					//	파일경로를 value로 저장
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO board = list.get(i);
			List<BoardCatVO> category = service.getCatByBno(board.getBno());
			for(int j=0;j<category.size();j++) {
				catList.add(category.get(j));
			}
		}
		//	게시글 프로필
		HashMap<Integer, String>profilePath = getProfileList(list);
		model.addAttribute("profilePath", profilePath);
		//	프로필 사진
		String profileImg = getProfileImg(userid);
		model.addAttribute("profile", profileImg);
		log.info("fileCallPath= " + fileCallPath);
		//	뷰페이지로 전달
		model.addAttribute("list",list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		int boardCnt = list.size();
		model.addAttribute("boardCnt", boardCnt);
	}
	
	private String getProfileImg(String userid) {
		AttachVO profileAttach = attachService.findByUserid(userid);
		String profilePath = "";
		if(profileAttach != null) {
			profilePath = profileAttach.getUploadPath() + "/" + 
			profileAttach.getUuid() + "_" + profileAttach.getFileName();
		}
		return profilePath;
	}
	
//	작성 게시글(ajax)
	@GetMapping("/listAjax")
	public String listAjax(String userid, Criteria cri, Model model) {
		List<BoardVO> list = service.readByUserid(userid);
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			fileCallPath.put(thumb.getBno(),	//	bno를 key로 설정
					thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
					//	파일경로를 value로 저장
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO board = list.get(i);
			List<BoardCatVO> category = service.getCatByBno(board.getBno());
			for(int j=0;j<category.size();j++) {
				catList.add(category.get(j));
			}
		}
		//	게시글 프로필
		HashMap<Integer, String>profilePath = getProfileList(list);
		model.addAttribute("profilePath", profilePath);
		log.info("fileCallPath= " + fileCallPath);
		//	뷰페이지로 전달
		model.addAttribute("list",list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/my/written";
	}
	
	//	댓글 작성한 게시글
	@GetMapping("/comment")
	public String comment(String userid, Criteria cri, Model model) {
		List<Integer> comments = commentService.getBnoByUserid(userid);
		Set<Integer> set = new HashSet<Integer>(comments);
		List<Integer> bnoList = new ArrayList<Integer>(set);
		List<BoardVO> list = new ArrayList<BoardVO>();
		for(int i=0;i<bnoList.size();i++) {
			Integer bno = bnoList.get(i);
			list.add(service.read(bno));
		}
		log.info("/like... " + list);
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			fileCallPath.put(thumb.getBno(),	//	bno를 key로 설정
					thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
					//	파일경로를 value로 저장
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO board = list.get(i);
			List<BoardCatVO> category = service.getCatByBno(board.getBno());
			for(int j=0;j<category.size();j++) {
				catList.add(category.get(j));
			}
		}
		//	게시글 프로필
		HashMap<Integer, String>profilePath = getProfileList(list);
		model.addAttribute("profilePath", profilePath);
		log.info("fileCallPath= " + fileCallPath);
		//	뷰페이지로 전달
		model.addAttribute("list",list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/my/written";
	}
	
	//	좋아요 누른 게시글
	@GetMapping("/like")
	public String like(String userid, Criteria cri, Model model) {
		List<LikeVO> likeList = service.getLikeByUserid(userid);
		List<BoardVO> list = new ArrayList<BoardVO>();
		for(int i=0;i<likeList.size();i++) {
			LikeVO like = likeList.get(i);
			Integer bno = like.getBno();
			BoardVO board = service.read(bno);
			list.add(board);
		}
		log.info("/like... " + list);
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			fileCallPath.put(thumb.getBno(),	//	bno를 key로 설정
					thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
					//	파일경로를 value로 저장
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO board = list.get(i);
			List<BoardCatVO> category = service.getCatByBno(board.getBno());
			for(int j=0;j<category.size();j++) {
				catList.add(category.get(j));
			}
		}
		log.info("fileCallPath= " + fileCallPath);
		//	뷰페이지로 전달
		model.addAttribute("list",list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/my/written";
	}
	
//	게시글 프로필사진
	private HashMap<Integer, String>getProfileList(List<BoardVO> boardList){
		HashMap<Integer, String> profilePath = new HashMap<Integer, String>();
		for(int i=0;i<boardList.size();i++) {
			BoardVO board = boardList.get(i);
			Integer bno = board.getBno();
			AttachVO attach = attachService.findByUserid(board.getUserid());
			if(attach != null) {
				profilePath.put(bno, attach.getUploadPath() + "/" + 
				attach.getUuid() + "_" + attach.getFileName());
			}
		}
		return profilePath;
	}
	
}