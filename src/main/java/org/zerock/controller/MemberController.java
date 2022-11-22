package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.AttachService;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	private BoardService boardService;
	private AttachService attachService;
	private PasswordEncoder passwordEncoder;

	@GetMapping("/join")
	public void join() {

	}

	// 회원가입 
	@PostMapping("/join")
	public String join(MemberVO member, RedirectAttributes rttr) {
		log.info("================================");
		log.info("register: " + member);
		service.join(member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/customLogin";
	}

	// 회원 정보 보기
	@GetMapping({ "/info", "/update" })
	public void info(@RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("info..." + userid);
		MemberVO member = service.info(userid);
		model.addAttribute("member", member);
		int boardCnt = boardService.getCountByUserid(userid);
		model.addAttribute("boardCnt", boardCnt);
		//	프로필 사진
		String profilePath = "";
		AttachVO profileAttach = attachService.findByUserid(userid);
		if(profileAttach != null) {
			profilePath = profileAttach.getUploadPath() + "/" + 
			profileAttach.getUuid() + "_" + profileAttach.getFileName();
		}
		model.addAttribute("profile", profilePath);
	} // 뷰 페이지 이름 : get->/board/get.jsp, modify->/board/modify.jsp

	
	// 회원 정보 수정
	@Transactional
	@PostMapping("/update")
//	@PreAuthorize("principal.username == #board.writer")
	public String update(MemberVO member, AttachVO attach,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("update... member: " + member);
		log.info("update... attach: " + attach);
		// 브라우저로부터 수정된 게시글 정보가 올라온다.
		// 게시글 정보를 업데이트(데이터베이스) -> 반환값 true:성공, false:실패
		if (service.update(member)) {
			// 게시글 수정이 성공되었는지 결과를 실어준다. -> 모달창을 띄워준다.
			rttr.addFlashAttribute("result", "success");
		}
		attachService.deleteByUserid(member.getUserid());
		attachService.insertProfile(attach);
		// /board/list로 redirect 하므로 pageNum, amount를 가지고 다니도록 추가
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		// 검색기능 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("userid", member.getUserid());
//		// board/list로 리다이렉트
		return "redirect:/member/info";
	}

}
