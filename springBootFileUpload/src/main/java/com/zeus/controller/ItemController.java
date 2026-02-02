package com.zeus.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zeus.domain.Item;
import com.zeus.service.ItemService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;

	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/createForm")
	public String createForm(Model model) {
		log.info("/createForm");
		return "/item/createForm";
	}

	@PostMapping("/create")
	public String itemCreate(Item item, Model model) throws IOException, Exception {
		log.info("/create item=" + item.toString());
		// 1. 파일업로드한것을 가져오기
		MultipartFile file = item.getPicture();
		// 2. 파일정보를 로그파일에 기록
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType: " + file.getContentType());
		// 3. 파일을 외장하드에 저장
		String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		// 4. 저장된 새로 생성된 파일명을 item 도메인에 저장
		item.setUrl(createdFileName);
		// 5. 테이블에 상품화면정보를 저장
		int count = itemService.create(item);
		
		if(count > 0) {
			model.addAttribute("message", "%s 상품등록 성공".formatted(file.getOriginalFilename()));
			return "item/success";
		}
		model.addAttribute("message", "%s 상품등록 실패".formatted(file.getOriginalFilename()));
		return "item/failed";
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대중복되지 않는 문자열 생성
		// uid = ed805397-46ba-4cb4-96c8-f7287de19aa1
		UUID uid = UUID.randomUUID();
		// ed805397-46ba-4cb4-96c8-f7287de19aa1_도훈.jpg
		String createdFileName = uid.toString() + "_" + originalName;
		// new File("D:/upload", "ed805397-46ba-4cb4-96c8-f7287de19aa1_도훈.jpg")
		// D:/upload/ed805397-46ba-4cb4-96c8-f7287de19aa1_도훈.jpg 내용이 없는 파일명만 생성
		File target = new File(uploadPath, createdFileName);
		//(실제 파일내용이 있는 바이트배열)byte[] fileData를 D:/upload/*.jpg 복사진행
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
	}
	
	@GetMapping("list")
	public String itemList(Model model) {
		List<Item> itemList = itemService.list();
		
		return "item/itemList";
	}
	
	
	
	
	

}
















