package web.portfolio.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.FileVO;
import web.portfolio.domain.ProductVO;
import web.portfolio.service.FileService;
import web.portfolio.service.ProductService;

@Controller
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	
	
	@Inject
	private ProductService prod_service;
	
	@Inject
	private FileService file_service;
	
	@RequestMapping(value="/contents")
	public void mainPage(ProductVO vo, Model model, Criteria criteria) throws Exception {
		model.addAttribute("list", prod_service.listAll());
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registProductGET(Model model) throws Exception {
		logger.info("regist");
		
		return "/main/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registProductPOST(ProductVO vo, RedirectAttributes rttr) throws Exception {
		logger.info(vo.toString());
		
		prod_service.createProduct(vo);
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/main/contents";
	}
	
	
	
	@RequestMapping(value="/readProduct")
	public void readProduct(@RequestParam Integer pid, Model model,Criteria criteria) throws Exception {
		model.addAttribute(prod_service.readProduct(pid));
	}
	
	
	@RequestMapping(value="/listFiles", method=RequestMethod.GET)
	public void fileReadGET(FileVO vo, Model model) throws Exception {
		
		
			file_service.deleteAll();
			
			if(vo.getFirst()==true) {
				vo.setPath("c:"+File.separator);
			
			
			File file=new File(vo.getPath());
			File[] files=file.listFiles();
			for(File f : files) {
				
				vo.setFilename(f.getName());
				vo.setPath(f.getPath());
				
				if(f.isFile()) {
					vo.setIsdir("file");
				}else if(f.isDirectory()) {
					vo.setIsdir("dir");
				}
				
				
				file_service.saveFile(vo);
			}
			
			vo.setFirst(false);
			
  }else{
			  
			  file_service.deleteAll();
			  File file=new File(vo.getPath());
				File[] files=file.listFiles();
				for(File f : files) {
					
					vo.setFilename(f.getName());
					vo.setPath(f.getPath());
					
					if(f.isFile()) {
						vo.setIsdir("file");
					}else if(f.isDirectory()) {
						vo.setIsdir("dir");
					}
					
					file_service.saveFile(vo);
				} /*end for*/
				
  }   /*end if*/
		
		model.addAttribute("fileVO", vo);
		model.addAttribute("list", file_service.listFile());
}
	
	
	/*@RequestMapping(value="/listFiles", method=RequestMethod.GET)
	public ResponseEntity<List<FileVO>> fileReadGET(FileVO vo) throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;

		try {
			file_service.deleteAll();
			
			if(vo.getFirst()==true) {
				vo.setPath("c:"+File.separator);
			
			
			File file=new File(vo.getPath());
			File[] files=file.listFiles();
			for(File f : files) {
				
				vo.setFilename(f.getName());
				vo.setPath(f.getPath());
				
				if(f.isFile()) {
					vo.setIsdir("file");
				}else if(f.isDirectory()) {
					vo.setIsdir("dir");
				}
				
				file_service.saveFile(vo);
			}
			entity=new ResponseEntity<List<FileVO>>(file_service.listFile(), HttpStatus.OK);
			
			vo.setFirst(false);
			
  }else{
			  
			  file_service.deleteAll();
			  File file=new File(vo.getPath());
				File[] files=file.listFiles();
				for(File f : files) {
					
					vo.setFilename(f.getName());
					vo.setPath(f.getPath());
					
					if(f.isFile()) {
						vo.setIsdir("file");
					}else if(f.isDirectory()) {
						vo.setIsdir("dir");
					}
					
					file_service.saveFile(vo);
				} end for
				
				entity=new ResponseEntity<List<FileVO>>(file_service.listFile(), HttpStatus.OK);
  }   end if
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(file_service.listFile(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}*/
	
	
}















