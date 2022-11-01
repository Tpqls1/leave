package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.AttachService;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	private AttachService attachService;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model, Integer catno) {
		if(catno == null) {
			List<BoardVO> list = service.getList(cri);
		}else {
			List<BoardVO> list = service.getList(cri);
		}
		//	게시글 썸네일을 HashMap으로반환
		List<AttachVO> thumbnail = attachService.getThumbnail();
		HashMap<Integer, String> fileCallPath = new HashMap<Integer, String>();
		for(int i=0;i< thumbnail.size();i++) {
			AttachVO thumb = thumbnail.get(i); 
			fileCallPath.put(thumb.getBno(),
					thumb.getUploadPath() + "/" + thumb.getUuid() + "_" + thumb.getFileName());
		}
		//	게시글 카테고리를 리스트로반환
		List<BoardCatVO> catList = new ArrayList<BoardCatVO>();
		for(int i=0;i<list.size();i++) {
			BoardVO board = list.get(i);
			List<BoardCatVO> category = service.getCatByBno(board);
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
	}
	
	@GetMapping("/post")
	public void post() {
		log.info("post...");
	}
	
	
	@PostMapping("/post")
	public String post(BoardVO board, RedirectAttributes rttr) {
		log.info("================================");
		Integer maxBno = service.getMaxBno() + 1;
		
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

	@GetMapping("/read")
	public void read() {
		log.info("read...");
	}
	
		// Criteria를 브라우저로부터 수신하고 뷰페이지로 전달을 해주도록 추가 -> @ModelAttribute를 사용
		// 비정상적인 방법으로 수정/삭제를 요구하는 경우를 고려한다. : 해킹 의도를 가진 요청
		@PostMapping("/modify")
		@PreAuthorize("principal.username == #board.writer")
		public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {		
			log.info("modify..." + board);
			// 게시글 정보를 업데이트(데이터베이스) -> 반환값 true:성공, false:실패
			if(service.update(board)) {
				// 게시글 수정이 성공되었는지 결과를 실어준다. -> 모달창을 띄워준다.
				// /board/list에서 모달창을 띄운다.
				rttr.addFlashAttribute("result", "success");
			}
			// /board /list로 redirect 하므로 pageNum, amount를 가지고 다니도록 추가
			
//			rttr.addAttribute("pageNum", cri.getPageNum());
//			rttr.addAttribute("amount", cri.getAmount());
//			rttr.addAttribute("type", cri.getType());
//			rttr.addAttribute("keyword", cri.getKeyword());
			// board/list로 리다이렉트
			return "redirect:/board/list" + cri.getListLink();
		}
	
	@PostMapping("/delete")
	@PreAuthorize("principal.userid == #userid")
	public String remove(@RequestParam("bno") Integer bno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr, String userid) {
		log.info("remove... " + bno);
		List<AttachVO> attachList = service.getAttachList(bno);
		if(service.delete(bno)) {
			// 첨부파일을 삭제
			attachService.deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	

	@GetMapping("/update")
	public void update() {
		log.info("update...");
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachVO>> getAttachList(Integer bno) {
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
}
