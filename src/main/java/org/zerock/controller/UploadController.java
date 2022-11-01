package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
//		@PreAuthorize("isAuthenticated()")	//	로그인한 사용자만 첨부파일을 추가할 수 있도록
		@PostMapping(value="/uploadFileAjax", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<AttachVO>> uploadAjaxPost(MultipartFile[] uploadFile, Model model , boolean attachType) {
			log.info("upload ajax post.....");
			List<AttachVO> list = new ArrayList<AttachVO>();
			String uploadFolder = "/Users/tpqls/upload/";
			
			String uploadFolderPath = getFolder();	// 저장된 폴더 경로
			File uploadPath = new File(uploadFolder, uploadFolderPath);
			log.info("upload path: " + uploadPath);
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();	// 전체 경로까지의 폴더를 생성
			}

			for(MultipartFile multipartFile : uploadFile) {
				AttachVO attachVO = new AttachVO();	// 첨부파일 정보를 저장하는 객체
				log.info("------------------------------");
				log.info("upload file name: " + multipartFile.getOriginalFilename());
				log.info("upload File Size: " + multipartFile.getSize());
				
				String uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				log.info("only file name: " + uploadFileName);
				attachVO.setFileName(uploadFileName);	// 원래 파일 이름을 저장
				
				// 파일의 중복 방지 : UUID -> 고유한 값을 발생
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;

				File saveFile = new File(uploadPath, uploadFileName);
				try {
					multipartFile.transferTo(saveFile);
					attachVO.setUuid(uuid.toString());
					attachVO.setUploadPath(uploadFolderPath);
					//	썸네일 생성
					FileOutputStream thumbnail = new FileOutputStream(
					new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),
					thumbnail, 100, 100);	// 이미지 크기 : 100px * 100px
					thumbnail.close();
					list.add(attachVO);
				} catch(Exception e) {
					log.error(e.getMessage());
				}
			}	// 뷰 페이지 이름 : /uploadFileAjax.jsp 파일
			// 첨부파일에 대한 정보를 응답
			return new ResponseEntity<List<AttachVO>>(list, HttpStatus.OK);
		}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, boolean attachType) {
		log.info("fileName: " + fileName);
		
		File file = new File("/Users/tpqls/upload/" + fileName);
		
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			// MIME type을 응답 : image/jpg, image/png, image/gif
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(
					FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, boolean attachType) {
		log.info("deleteFile: " + fileName);
		File file;
		try {
			file = new File("/Users/tpqls/upload/" + URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			String largeFileName = file.getAbsolutePath().replace("s_", "");
			log.info("largeFileName: " + largeFileName);
			file = new File(largeFileName);
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);	// '-'->'\' 또는 '/'
	}
}

