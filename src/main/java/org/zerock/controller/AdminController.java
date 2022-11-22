package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.TagVO;
import org.zerock.service.AdminService;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@PreAuthorize("isAuthenticated()")
@Controller // Controller로서 동작을 한다고 스프링에게 알린다.
@RequestMapping("/admin/*") // /board 라는 url을 사용한다고 설정
@Log4j
@AllArgsConstructor
public class AdminController {
	// BoardService를 주입 받는다.(생성자로 주입)
	private AdminService service;
	private BoardService boardService;

	// 게시글 목록 보기
//	@GetMapping("/list")	// /board/list로 동작을 하겠다.
//	public void list(Model model) {
//		// Model에 게시글 목록 정보를 실어서 /board/list.jsp에게 전달
//		List<BoardVO> list = service.getList();
//		model.addAttribute("list", list);
//	}	// 뷰페이지 이름 : /board/list.jsp

	// 게시글 목록 보기 : 페이징 처리
	// 사용자로부터 몇 페이지를 보여줄지를 입력 받아야 한다.
	/*
	 * 페이징 처리를 위하여 고려해야 할 사항 1. 데이터베이스에서 해당 페이지의 게시글 목록을 가져오기 2. 뷰 페이지에서 페이징 처리를 위한
	 * 화면을 적용 - 시작 페이지, 마지막 페이지 : 1~10페이지 - 이전 버튼, 다음 버튼 3. 전체 게시글의 수 -> 페이징 처리를 위한
	 * 뷰를 보여주는 데이터를 만든다.
	 */

	// 인덱스 페이지
	@GetMapping("/index") // /board/list로 동작을 하겠다.
	public void index(Criteria cri, Model model) {
		log.info("index... " + cri);
		// Model에 게시글 목록 정보를 실어서 /board/list.jsp에게 전달
		List<MemberVO> list = service.getMemberList(cri);
		model.addAttribute("list", list);
		// 페이징 처리를 위한 객체 pageDTO 정보를 전달해 주어야 한다.
		// 데이터베이스에서 전체 데이터의 수를 검색해서 가져와야 한다.
		int total = service.getTotalCount(cri);
		int boardCnt = boardService.getTotal();
		model.addAttribute("totalBoard", boardCnt);
		model.addAttribute("totalMember", total);
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 뷰 페이지로 전달
	} // 뷰페이지 이름 : /admin/index.jsp

	// 관리자 정보 보기
	@GetMapping("/info")
	public void info(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("info..." + userid);
		MemberVO member = service.get(userid);
		model.addAttribute("member", member);
	} // 뷰 페이지 이름 : admin/get

	// 회원 목록
	@GetMapping("/memberList") // /admin/memberList로 동작을 하겠다.
	public void memberList(Criteria cri, Model model) {
		log.info("list... " + cri);
		// Model에 게시글 목록 정보를 실어서 /board/list.jsp에게 전달
		List<MemberVO> list = service.getMemberList(cri);
		model.addAttribute("list", list);
		// 페이징 처리를 위한 객체 pageDTO 정보를 전달해 주어야 한다.
		// 데이터베이스에서 전체 데이터의 수를 검색해서 가져와야 한다.
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 뷰 페이지로 전달
	} // 뷰페이지 이름 : admin/memberList.jsp

	// 게시글 목록
	@GetMapping("/list") // /board/list로 동작을 하겠다.
	public void list(Criteria cri, Model model) {
		log.info("list... " + cri);
		// Model에 게시글 목록 정보를 실어서 /board/list.jsp에게 전달
		List<BoardVO> list = service.getList(cri);
		model.addAttribute("list", list);
		// 페이징 처리를 위한 객체 pageDTO 정보를 전달해 주어야 한다.
		// 데이터베이스에서 전체 데이터의 수를 검색해서 가져와야 한다.
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 뷰 페이지로 전달
	} // 뷰페이지 이름 : /admin/list.jsp

	// 게시글 상세보기 : /board/get : bno
	// 브라우저로 올라온 파라미터를 다시 브라우저로 전달하기 위해 @RequestParam를 사용
	// 뷰페이지로 데이터를 전달하기 위해 Model에 실어준다.
	// Criteria를 수신하고 뷰 페이지로 전달을 하도록 추가 -> @ModelAttribute 어노테이션을 사용

	// 회원 정보 상세보기
	@GetMapping("/memberGet")
	public void getMember(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("memberGet..." + userid);
		MemberVO member = service.get(userid);
		model.addAttribute("member", member);
	} // 뷰 페이지 이름 : admin/memberGet

	@GetMapping("/get")
	public void get(@RequestParam("bno") Integer bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get…" + bno);
		BoardVO board = service.get(bno);
		List<TagVO> tag = service.getTag(bno);
		model.addAttribute("board", board);
		model.addAttribute("tag", tag);
	} // 뷰 페이지 이름 :

	// 회원 삭제 : /board/remove : bno
	// 리다이렉트 /admin/memberlist
	// RedirectAttribute(모달창)에 성공여부를 전송
	// 브라우저로부터 전달된 Criteria를 수신하고
	@PostMapping("/removeMember")
	public String removeMember(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr, String writer) {
		log.info("remove... " + userid);
		if (service.remove(userid)) {
			// 첨부파일을 삭제
			rttr.addFlashAttribute("result", "success");
		}
		// /board/list로 redirect 하므로 pageNum, amount를 가지고 다니도록 추가
//			rttr.addAttribute("pageNum", cri.getPageNum());
//			rttr.addAttribute("amount", cri.getAmount());
//			rttr.addAttribute("type", cri.getType());
//			rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/memberList" + cri.getListLink();
	}

	// 게시글 삭제 : /board/remove : bno
	// 리다이렉트 /board/list
	// RedirectAttribute(모달창)에 성공여부를 전송
	// 브라우저로부터 전달된 Criteria를 수신하고
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Integer bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr,
			String writer) {
		log.info("remove... " + bno);
		List<AttachVO> attachList = service.getAttachList(bno);
		if (service.remove(bno)) {
			// 첨부파일을 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		// /board/list로 redirect 하므로 pageNum, amount를 가지고 다니도록 추가
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/list" + cri.getListLink();
	}

	private void deleteFiles(List<AttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\java\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_"
						+ attach.getFileName());
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\java\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid()
							+ "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}

	// 첨부 파일 목록에 대한 정보를 Ajax로 요청할 때 처리
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachVO>> getAttachList(Integer bno) {
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

}
