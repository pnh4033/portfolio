package web.portfolio.controller;

import java.io.File;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.portfolio.domain.FileVO;
import web.portfolio.service.FileService;

@Controller
@RequestMapping(value="/file/*")
public class FileController {
	
	@Inject
	private FileService service;
	
	
	@RequestMapping(value="/readFile", method=RequestMethod.GET)
	public void fileReadGET(Model model, FileVO vo) throws Exception {
		service.deleteAll();
		
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
			
			service.saveFile(vo);
		}
		
		vo.setFirst(false);
		
	  }else{
		  
		  service.deleteAll();
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
				
				service.saveFile(vo);
			} 
	  }
		
		model.addAttribute("list", service.listFile());
		model.addAttribute("fileVO", vo);
		
	}
	
	@RequestMapping(value="/readFile", method=RequestMethod.POST)
	public String fileReadPOST(Model model, FileVO vo) throws Exception {
		service.deleteAll();
		
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
			
			service.saveFile(vo);
		}
		
		model.addAttribute("c", service.listFile());
		model.addAttribute("fileVO", vo);
		
		return "fileView";
	}
	
	@RequestMapping(value="/fileView", method=RequestMethod.GET)
	public void fileViewGET(Model model, @RequestParam("fno") Integer fno, FileVO vo) throws Exception {
		
		
		System.out.println(fno.toString());
		
		/*String str=service.readPath(fno).replace("\\", File.separator);*/
		vo=service.readFile(fno);
		String str=vo.getPath();
		System.out.println(vo.toString());
		
		model.addAttribute(service.readFile(fno));
		
		File file=new File(str);
		File[] files=file.listFiles();
		
          for(File f : files) {
			
			vo.setFilename(f.getName());
			vo.setPath(f.getPath());
			
			if(f.isFile()) {
				vo.setIsdir("file");
			}else if(f.isDirectory()) {
				vo.setIsdir("dir");
			}
			
			System.out.println(vo.toString());
			service.saveFile(vo);
		 }
          
         model.addAttribute("list", service.listFile()); 
		
	}
	
	@RequestMapping(value="/fileView", method=RequestMethod.POST)
	public String fileViewPOST(Model model, FileVO vo,
			@RequestParam("fno") Integer fno) throws Exception {
		
		System.out.println(vo.toString());
		return "fileView";
		
	}
	
	
}
