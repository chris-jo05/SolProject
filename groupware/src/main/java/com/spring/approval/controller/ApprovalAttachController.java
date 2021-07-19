package com.spring.approval.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.approval.domain.ApprovalAttachVO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
public class ApprovalAttachController {

	@PostMapping("/appUploadAttach")
	public ResponseEntity<List<ApprovalAttachVO>> uploadFormPost(MultipartFile[] appAttachMent) {
		log.info("파일 업로드를 요청 " + appAttachMent);

		String appUploadFileName = null;
		String appUploadFolder = "c:\\Solcompany";

		String appUploadFolderPath = getFolder();
		File appUploadPath = new File(appUploadFolder, appUploadFolderPath);

		// 폴더가 존재하지 않을 경우 폴더를 생성해준다.
		if (!appUploadPath.exists()) {
			appUploadPath.mkdirs();
		}

		List<ApprovalAttachVO> appAttachList = new ArrayList<ApprovalAttachVO>();

		for (MultipartFile f : appAttachMent) {
			UUID appuuid = UUID.randomUUID();

			appUploadFileName = appuuid.toString() + "_" + f.getOriginalFilename();

			ApprovalAttachVO appAttach = new ApprovalAttachVO();
			appAttach.setDoc_fileName(f.getOriginalFilename());
			appAttach.setDoc_uploadPath(appUploadFolderPath);
			appAttach.setDoc_uuid(appuuid.toString());

			try {
				File saveFile = new File(appUploadPath, appUploadFileName);

				// 이미지 파일 여부 확인
				if (checkImageType(saveFile)) {
					// 이미지 파일일 경우 true 리턴
					appAttach.setDoc_fileType(true);

					// 썸네일 저장
					FileOutputStream thumbNail = new FileOutputStream(new File(appUploadPath, "s_" + appUploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbNail, 100, 100);
					in.close();
					thumbNail.close();
				}
				// 파일 원본 그대로 저장하기
				f.transferTo(saveFile);
				appAttachList.add(appAttach);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<ApprovalAttachVO>>(appAttachList, HttpStatus.OK);
	}

	//파일 다운로드
	@GetMapping(value = "/appFileDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> appFileDownload(String fileName) {
		log.info("File Download " + fileName);

		Resource resource = new FileSystemResource("c:\\Solcompany\\" + fileName);

		HttpHeaders headers = new HttpHeaders();

		//경로를 제거한 uuid + 파일명이 된다.
		String uidFileName = resource.getFilename();
		//uuid값을 제외한 파일명 추출
		String resourceName = uidFileName.substring(uidFileName.indexOf("_") + 1);

		try {
			//한글처리 하여 파일명 다운로드 받을 수 있게 하기
			headers.add("Content-Disposition", "appAttachMent;filename=" + URLEncoder.encode(resourceName, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	//upload 폴더에 있는 파일삭제
	@PostMapping("/AppDeleteFile")
	public ResponseEntity<String> AppDeleteFile(String fileName, String type) {
		log.info("파일삭제 : " + fileName + " 타입 : " + type);

		try {
			File file = new File("c:\\Solcompany\\" + URLDecoder.decode(fileName, "utf-8"));

			file.delete();

			if (type.equals("image")) {
				//원본 이미지 파일명 추출
				String largeName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	//첨부 파일이 이미지인지 아닌지 판단
	private boolean checkImageType(File file) {
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	//폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
}
