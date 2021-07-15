package com.spring.mail.controller;

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

import com.spring.mail.domain.FileAttachVo;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
public class UploadAttachController {

	@PostMapping("/uploadAttach")
	public ResponseEntity<List<FileAttachVo>> uploadFormPost(MultipartFile[] attachment){
		log.info("파일 업로드를 요청합니다 " + attachment);
		
		String uploadFileName = null;
		String uploadFolder = "c:\\Solcompany";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		// 폴더가 존재하지 않을 경우 폴더를 생성해준다.
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		List<FileAttachVo> attachList = new ArrayList<FileAttachVo>();
		
		for(MultipartFile f : attachment) {
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			
			FileAttachVo attach = new FileAttachVo();
			attach.setFileName(f.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				
				// 이미지 파일 여부 확인
				if(checkImageType(saveFile)) {
					// 이미지 파일일 경우 true 리턴
					attach.setFileType(true);
					
					// 썸네일 저장
					FileOutputStream thumbNail = new FileOutputStream(new File(uploadPath,"s_" + uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbNail, 100, 100);
					in.close();
					thumbNail.close();
				}
				// 파일 원본 그대로 저장하기
				f.transferTo(saveFile);
				attachList.add(attach);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<FileAttachVo>>(attachList,HttpStatus.OK);
	}
	
	//파일 다운로드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName){
		log.info("download file "+fileName);
			
		Resource resource = new FileSystemResource("c:\\Solcompany\\"+fileName);
			
		HttpHeaders headers = new HttpHeaders();
			
		//경로를 제거한 uuid + 파일명이 된다.
		String uidFileName = resource.getFilename();
		//uuid값을 제외한 파일명 추출
		String resourceName = uidFileName.substring(uidFileName.indexOf("_")+1);

		try {
			//한글처리 하여 파일명 다운로드 받을 수 있게 하기
			headers.add("Content-Disposition", "attachment;filename="+URLEncoder.encode(resourceName, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
			
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	//upload 폴더에 있는 파일삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("파일 삭제 : "+fileName + " 타입 : "+ type);
		
		try {
			File file = new File("c:\\upload\\"+URLDecoder.decode(fileName,"utf-8"));
			
			file.delete();
				
			if(type.equals("image")) {
				//원본 이미지 파일명 추출
				String largeName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
			
		return new ResponseEntity<String>("success",HttpStatus.OK);
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
