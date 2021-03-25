package com.shop.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.paging.Criteria;
import com.shop.paging.PageMaker;
import com.shop.service.AdminService;
import com.shop.utile.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private String uploadPath = "C:\\Users\\82108\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\shoppingMall\\resources";
	
	@Autowired
	private AdminService service;

	
	
	//관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void indexGET()throws Exception{
		logger.info("get 관리자");
	}
	
	//상품 등록 get
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void registerGET(Model model)throws Exception{
		logger.info("get 상품 등록");
		
		List<CategoryVO> category = null; 
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
						//category를 JSON타입으로 변경한뒤, category라는 명칭으로 model에 추가
	}
	
	//상품 등록 post
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String registerPOST(GoodsVO vo, MultipartFile file)throws Exception{
//		logger.info("post 상품 등록");
//		logger.info("=================================");
//		logger.info("파일이름 : " + file.getOriginalFilename());
//		logger.info("파일크기 : " + file.getSize());
//		logger.info("컨텐트 타입 : " + file.getContentType());
//		logger.info("=================================");
											//File.separtor= / 역할을 함
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
		String ymPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월 폴더를 생성
		String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
				
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymPath);
	
			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {  // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함
			
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}		
		service.register(vo);
		return "redirect:/admin/goods/list";
	}
	
	//상품 목록 + 페이징
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public String goodsListGET(Model model, Criteria cri)throws Exception{
		logger.info("get 상품 목록 + 페이징~");
		
		List<GoodsVO> list = null; 
		list = service.goodslist(cri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.count(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/goods/list";
	}
	
	//상품 디테일
	@RequestMapping(value = "/goods/detail", method = RequestMethod.GET)
	public void goodsDetailGET(@RequestParam("n")int gdsNum, Model model)throws Exception{
		logger.info("get 상품 디테일 페이지");
		
		GoodsVO goods = service.goodsDetail(gdsNum);
		
		model.addAttribute("goods", goods);
	}
	
	//상품 수정 GET
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void goodsModifyGET(@RequestParam("n")int gdsNum, Model model)throws Exception{
		logger.info("get 상품 수정");
		
		GoodsVO goods = service.goodsDetail(gdsNum);
		model.addAttribute("goods", goods);
		
	}
	
	//상품 수정 POST
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String goodsModifyPOST(GoodsVO vo, MultipartFile file, HttpServletRequest req)throws Exception{
		logger.info("POST 상품 수정");								//HttpServletRequset를 사용하면 값을 받아올 수 있다
		
		//새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			//기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			
			//새로 첨부한 파일을 등록해준다
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}else { //새로운 파일이 등록되지 않았다면
			//기존 이미지를 그대로 사용
		vo.setGdsImg(req.getParameter("gdsImg"));
		vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}
		service.goodsModify(vo);
		return "redirect:/admin/goods/list";
	}
	
	//상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String goodsDeletePOST(@RequestParam("n")int gdsNum)throws Exception{
		logger.info("POST 상품 삭제");
		
		service.goodsDelete(gdsNum);
		return "redirect:/admin/goods/list";
	}

}
