package web.portfolio.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import web.portfolio.domain.FileVO;
import web.portfolio.service.FileService;

@RestController
@RequestMapping(value="/file")
public class FileController {
	
	@Inject
	private FileService service;
	
	

	@RequestMapping(value="/listFiles", method=RequestMethod.GET)
	public ResponseEntity<List<FileVO>> fileReadGET(FileVO vo) throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;

		try {
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
			entity=new ResponseEntity<List<FileVO>>(service.listFile(), HttpStatus.OK);
			
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
				} /*end for*/
				
				entity=new ResponseEntity<List<FileVO>>(service.listFile(), HttpStatus.OK);
  }   /*end if*/
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(service.listFile(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value="/listFiles", method=RequestMethod.POST)
	public ResponseEntity<List<FileVO>> fileReadPOST(@RequestBody FileVO vo) throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;

		try {
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
				entity=new ResponseEntity<List<FileVO>>(service.listFile(), HttpStatus.OK);
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
					entity=new ResponseEntity<List<FileVO>>(service.listFile(), HttpStatus.OK);
				} /*end for*/
				
  }   /*end if*/
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(service.listFile(), HttpStatus.BAD_REQUEST);
		}
		
		
		
		/*try{
			entity=new ResponseEntity<>(service.listFile(), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(service.listFile(), HttpStatus.BAD_REQUEST);
		}*/
		
		return entity;
		
		

		
	}
	
	/*@RequestMapping(value="/listFiles", method=RequestMethod.POST)
	public ResponseEntity<List<FileVO>> fileReadPOST(@RequestBody FileVO vo) throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;
		
		
		try {
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
				
				entity=new ResponseEntity<>(service.listFile(), HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
		
		
		
		
		
		
		
		
		
		model.addAttribute("c", service.listFile());
		model.addAttribute("fileVO", vo);
		
		return "fileView";
	}*/
	
	
	
	
	
	
	
	/*@RequestMapping(value="/fileView", method=RequestMethod.GET)
	public void fileViewGET(Model model, @RequestParam("fno") Integer fno, FileVO vo) throws Exception {
		
		
		System.out.println(fno.toString());
		
		String str=service.readPath(fno).replace("\\", File.separator);
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
		
	}*/
	
	
	
	@RequestMapping(value="/setFile", method=RequestMethod.POST)
	public ResponseEntity<List<FileVO>> setFile() throws Exception {
		
		ResponseEntity<String> entity=null;
		
		try {
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return null;
	}
	
	
}



















