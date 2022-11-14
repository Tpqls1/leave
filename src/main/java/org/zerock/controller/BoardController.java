package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardCatVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.CommentsVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.TagVO;
import org.zerock.service.AttachService;
import org.zerock.service.BoardService;
import org.zerock.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	private AttachService attachService;
	private CommentService comService;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		List<BoardVO> list = service.getList(cri);
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			//	nullCheck
			if(thumb != null) {
				fileCallPath.put(thumb.getBno(),	//	bno를 key로 설정
						thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
				//	파일경로를 value로 저장
			}
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
		//	게시글 프로필사진
		HashMap<Integer, String> profilePath = getProfileList(list);
		model.addAttribute("profilePath", profilePath);
		log.info("fileCallPath= " + fileCallPath);
		//	뷰페이지로 전달
		model.addAttribute("list",list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
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
	
	//	상세보기 프로필사진
	private String getProfileImg(String userid) {
		AttachVO profileAttach = attachService.findByUserid(userid);
		String profilePath = "";
		if(profileAttach != null) {
			profilePath = profileAttach.getUploadPath() + "/" + 
			profileAttach.getUuid() + "_" + profileAttach.getFileName();
		}
		return profilePath;
	}
	
	//	카테고리별 게시글
	@GetMapping("/listAjax")
	public void listAjax(@Param("cri")Criteria cri, Model model, @Param("catno")Integer catno) {
		List<BoardVO> list = service.getListWithPagingByCatNo(cri,catno);
		//	게시글 썸네일을 HashMap으로반환
			List<AttachVO> thumbnail = new ArrayList<AttachVO>();
			for(int i=0;i<list.size();i++) {
				Integer bno = list.get(i).getBno();
				thumbnail.add(attachService.getThumbnailByBno(bno));
			}
			HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
			for(int i=0;i< thumbnail.size();i++) {
				AttachVO thumb = thumbnail.get(i); 
				if(thumb != null) {
					//	nullCheck
					fileCallPath.put(thumb.getBno(),
							thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
				}
			}
			//	게시글 카테고리를 리스트로반환
			List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
			for(int i=0;i<list.size();i++) {
				BoardVO board = list.get(i);
				List<BoardCatVO> cat = service.getCatByBno(board.getBno());
				for(int j=0;j<cat.size();j++) {
					catList.add(cat.get(j));
				}
			}
			//	게시글 프로필사진
			HashMap<Integer, String>profilePath = getProfileList(list);
			//	뷰페이지로 전달
			model.addAttribute(profilePath);
			model.addAttribute("list",list);
			model.addAttribute("fileCallPath", fileCallPath);
			model.addAttribute("catList", catList);
			int total = service.getTotalCountByCatNo(cri, catno);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
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
	
	//	게시글 상세
	@GetMapping("/read")
	public void read(Criteria cri, Model model, Integer bno, Authentication authentication) {
		log.info("read...");
		BoardVO board = service.read(bno);
		//	게시글썸네일
		AttachVO thumbnail = attachService.getThumbnailByBno(bno);
		String thumbnailPath = null;
		if(thumbnail != null) {
			thumbnailPath = thumbnail.getUploadPath() + "/" + thumbnail.getUuid() + "_" + thumbnail.getFileName();
			log.info(thumbnailPath);
		}
		//	게시글사진(썸네일제외)
		List<AttachVO> attachList = attachService.findByBno(bno);
		List<String>attachPath = new ArrayList<String>();
		for(int i=0;i<attachList.size();i++) {
			AttachVO attach = attachList.get(i); 
			attachPath.add(attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
		}
		//	해시태그
		List<TagVO> tagList = service.getTagByBno(bno);
		//	좋아요
		LikeVO likeVO = new LikeVO();
		likeVO.setBno(board.getBno());
			UserDetails userDetails = (UserDetails)authentication.getPrincipal();
			String userid = userDetails.getUsername();
		likeVO.setUserid(userid);
		int like = service.getLike(likeVO);
		List<BoardCatVO> categories = service.getCatByBno(bno);
		//	댓글
		List<CommentsVO> comments = comService.getList(bno);
		//	댓글 프로필
		HashMap<Integer, String> commentsProfile = getComProfile(comments);
		model.addAttribute("comProfile", commentsProfile);
		//	상세보기 프로필 부분
		String profileImg = getProfileImg(board.getUserid());
		model.addAttribute("profileImg", profileImg);
		//	상세보기 부분
		model.addAttribute("like", like);
		model.addAttribute("board",board);
		model.addAttribute("comments",comments);
		model.addAttribute("thumbnailPath",thumbnailPath);
		model.addAttribute("attachPath", attachPath);
		model.addAttribute("categories",categories);
		model.addAttribute("tagList", tagList);
		//	관련게시글 부분
		List<BoardVO> list = service.getListByCatList(categories);
		List<AttachVO> thumbList = new ArrayList<AttachVO>();
		for(int i=0;i<list.size();i++) {
			Integer thumbnailBno = list.get(i).getBno();
			thumbList.add(attachService.getThumbnailByBno(thumbnailBno));
		}
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbList.size();i++) {
			AttachVO thumb = thumbList.get(i); 
			if(thumb != null) {
				//	nullCheck
				fileCallPath.put(thumb.getBno(),
						thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
			}
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO boardVO = list.get(i);
			List<BoardCatVO> cat = service.getCatByBno(boardVO.getBno());
			for(int j=0;j<cat.size();j++) {
				catList.add(cat.get(j));
			}
		}
		//	관련게시글 프로필사진
		HashMap<Integer, String>profilePath = getProfileList(list);
		model.addAttribute(profilePath);
		model.addAttribute("list", list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
		int total = 0;
		for(int i=0;i<categories.size();i++) {
			BoardCatVO category = categories.get(i); 
			Integer catno =  category.getCatno();
			log.info(catno);
			total += service.getTotalCountByCatNo(cri, catno);
		}
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}//	end of read

	@GetMapping("/post")
	public void post(Criteria cri, Model model, Integer bno) {
		log.info("post...");
		BoardVO board = service.read(bno);
		model.addAttribute("board", board);
	}
	
	@PostMapping("/post")
//	@PreAuthorize("principal.userid == #board.userid")
	public String post(BoardVO board, RedirectAttributes rttr) {
		log.info("================================");
		Integer maxBno = service.getMaxBno();
		
		log.info(maxBno);
		board.setBno(maxBno);			
		log.info("post... : " + board);	// 디버깅 목적으로 출력
		service.insert(board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
			attachService.insert(board);
		}
		log.info("================================");
		rttr.addFlashAttribute("result", board.getBno());
		log.info(board.getBno());
		return "redirect:/board/list";	
	}
	
	
	
	@PostMapping("/delete") 
//	@PreAuthorize("principal.userid == #userid")
	public String remove(@RequestParam("bno") Integer bno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr, String userid) {
		log.info("delete... " + bno);
		service.delete(bno);
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping("/hashtag")
	public void hashtag(TagVO tag,Model model) {
		String tagName = tag.getTagName();
		List<BoardVO> duplicateList = service.getListByHashTag(tagName);
		log.info(duplicateList);
		Set<BoardVO> set = new HashSet<BoardVO>(duplicateList);
		log.info(set);
		List<BoardVO> list = new ArrayList<BoardVO>(set);

		List<AttachVO> thumbList = new ArrayList<AttachVO>();
		for(int i=0;i<list.size();i++) {
			Integer thumbnailBno = list.get(i).getBno();
			thumbList.add(attachService.getThumbnailByBno(thumbnailBno));
		}
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbList.size();i++) {
			AttachVO thumb = thumbList.get(i); 
			if(thumb != null) {
				//	nullCheck
				fileCallPath.put(thumb.getBno(),
						thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
			}
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO boardVO = list.get(i);
			List<BoardCatVO> cat = service.getCatByBno(boardVO.getBno());
			for(int j=0;j<cat.size();j++) {
				catList.add(cat.get(j));
			}
		}
		//	게시글 프로필사진
		HashMap<Integer, String> profilePath = getProfileList(list);
		model.addAttribute(profilePath);
		model.addAttribute("list", list);
		model.addAttribute("fileCallPath", fileCallPath);
		model.addAttribute("catList", catList);
	}
	
	//	좋아요 버튼
	//@PreAuthorize("principal.userid == #userid")
	@PostMapping("/like")
	public void like(LikeVO like, Model model) {
		int result = service.insertLike(like);
		model.addAttribute("result", result);
		Integer likeCnt = service.getLikeCnt(like.getBno());
		model.addAttribute("likeCnt", likeCnt);
	}

//	@PreAuthorize("principal.userid == #userid")
	@GetMapping("/update")
	public void update(Integer bno, Model model) {
		log.info("update...");
		BoardVO board = service.read(bno);
		model.addAttribute("board",board);
		List<TagVO> tagList = service.getTagByBno(bno);
		List<BoardCatVO> catList = service.getCatByBno(bno);
		model.addAttribute("catList", catList);
		int tagIndex = tagList.size();
		model.addAttribute("tagIndex", tagIndex);
		log.info("update...board: " + board);
	}

	@PostMapping("/update")
//	@PreAuthorize("principal.userid == #userid")
	public String update(BoardVO board, RedirectAttributes rttr) {
		log.info("modify..." + board);
		Integer bno = board.getBno();
		if(service.update(board)) {
			rttr.addFlashAttribute("result", bno);
		}
		return "redirect:/board/read?bno=" + bno;
	}
	
	@GetMapping("/getTagList")
	public ResponseEntity<List<TagVO>> getTagList(Integer bno){
		log.info("getTagList..." + bno);
		return new ResponseEntity<>(service.getTagByBno(bno), HttpStatus.OK);
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachVO>> getAttachList(Integer bno) {
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
}
