package web.portfolio.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import web.portfolio.domain.ImgListVO;
import web.portfolio.domain.ProductVO;
import web.portfolio.persistence.ProductDAO;
import web.portfolio.service.ProductService;
import web.portfolio.utils.MediaUtil;
import web.portfolio.utils.UploadImageUtils;



@RestController
public class UploadController {
	
	private static final Logger logger=LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private ProductDAO dao;
	
	@Inject
	private ProductService service;
	
	
	
	
	
	@RequestMapping(value="/main/upload", method=RequestMethod.GET)
	public void upload() {
		
	}
	
	
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/main/upload", method=RequestMethod.POST)
	public ResponseEntity<List<String>> upload(@RequestPart List<MultipartFile> mFile,
			ProductVO vo) throws Exception {
		
		
		ResponseEntity<List<String>> entity=null;
		
		logger.info("MultipartFile : "+mFile.toString());
		List<String> list=new ArrayList<>();
		
		try{
			
			Iterator<MultipartFile> it=mFile.iterator();
			
			String fileName="";
			String oriName="";
			
				
			while(it.hasNext()) {
				
				byte[] imgData=null;
				MultipartFile file=null;
				
				file=it.next();
				
				imgData=file.getBytes();
				oriName=file.getOriginalFilename();
				logger.info("upload oriName : "+oriName);

				if((oriName != null) || (oriName != "")) {
				
				
				/*이미지를 uploadPath에 저장하고 전체 경로를 포함한 파일명을 반환*/
					
					fileName=UploadImageUtils.uploadImg(uploadPath, oriName, imgData);
					logger.info("fileName : "+fileName);
					
				}
				
				
				/*저장된 이미지 리스트*/
				if(fileName != null) {
					
					list.add(fileName);
					
				}
				
			}

			

			
			logger.info("list : "+list);
			entity=new ResponseEntity<List<String>>(list, HttpStatus.CREATED);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		

		
		return entity;
	}

	
	
	
	
	
	/*readProduct.jsp 로부터 원본 이미지 경로를 받아 원본 이미지 출력*/
	@ResponseBody
	@RequestMapping(value="/main/listImgs")
	public ResponseEntity<byte[]> listImgs(@RequestParam("fileName") String fileName) throws Exception {
		
		InputStream inputStream=null;
		ResponseEntity<byte[]> entity=null;
		
		try{
			
			/*파일 타입이 이미지 인지 검사*/
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtil.getMediaType(formatName);
			
			HttpHeaders headers=new HttpHeaders();
			String path=uploadPath+fileName;
			path.replace("\\\\", "/");
			path.replace("\\", "/");
			
			
			logger.info("uploadPath+fileName : "+path);
			inputStream=new FileInputStream(path);
			
			if(mType != null) {
				
				headers.setContentType(mType);
				
			}else{
				
				/*이미지가 아닌 경우*/
				fileName=fileName.substring(fileName.lastIndexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; fileName=\""+
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
				
			}
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream)
					, headers, HttpStatus.CREATED);
			
			
			
		}catch(Exception e) {

			e.printStackTrace();
			
		}finally{
			
			inputStream.close();
			
		}
		
		
		
		return entity;
		
	}
	
	
	
	
	
	/*pno에 해당하는 샘플 이미지 출력*/
	@ResponseBody
	@RequestMapping(value="/main/listImgsPno")
	public ResponseEntity<byte[]> listImgsPno(@RequestParam("pno") Integer pno) throws Exception {
		
		InputStream inputStream=null;
		ResponseEntity<byte[]> entity=null;
		
		try{
			
			
			String fileName=service.getOneImg(pno);
			
			/*파일 타입이 이미지 인지 검사*/
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtil.getMediaType(formatName);
			
			HttpHeaders headers=new HttpHeaders();
			String path=uploadPath+fileName;
			path.replace("\\\\", "/");
			path.replace("\\", "/");

			logger.info("uploadPath+fileName : "+path);
			
			inputStream=new FileInputStream(path);
			
			if(mType != null) {
				
				headers.setContentType(mType);
				
			}else{
				
				/*이미지가 아닌 경우*/
				fileName=fileName.substring(fileName.lastIndexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; fileName=\""+
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
				
			}
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream)
					, headers, HttpStatus.CREATED);
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally{
			
			inputStream.close();
			
		}
		
		
		
		return entity;
		
	}
	
	
	

	
	/*readProduct.jsp 로부터 pno에 해당하는 attach된 파일들을 db에서 읽어온 후 이미지 경로들을 리스트 형태로 반환*/ 
	@RequestMapping("/main/listImgsString/{pno}")
	@ResponseBody
	public ResponseEntity<List<String>> listImgsString(@PathVariable Integer pno) throws Exception {
		
		ResponseEntity<List<String>> entity=null;
		
		List<String> list=new ArrayList<>();
		
		try{

			list=service.getAllImg(pno);
			entity=new ResponseEntity<>(list, HttpStatus.OK);
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
}















