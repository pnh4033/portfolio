package web.portfolio.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import web.portfolio.domain.FileVO;
import web.portfolio.service.FileService;




/////////////////
// 현재 사용하지 않음 //
// 개인 참고용           //
/////////////////





@RestController
@RequestMapping(value="/file")
public class FileController {
	
	@Inject
	private FileService service;
	
	@RequestMapping(value="/listFiles", method=RequestMethod.GET)
	public ResponseEntity<List<FileVO>> fileReadGET(FileVO vo) throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;

		List<FileVO> fileList=new ArrayList<>();
		try {
			
				vo.setPath("c:"+File.separator);
			
			
			File file=new File(vo.getPath());
			File[] files=file.listFiles();
			for(File f : files) {
				vo=new FileVO();
				
				vo.setFilename(f.getName());
				vo.setPath(f.getCanonicalPath());
				
				if(f.isFile()) {
					vo.setIsdir("file");
				}else if(f.isDirectory()) {
					vo.setIsdir("dir");
				}
				
				System.out.println(vo.getIsdir());
				fileList.add(vo);

				/*service.saveFile(vo);*/
				
			}
			/*entity=new ResponseEntity<List<FileVO>>(service.listFile(), HttpStatus.OK);*/
			entity=new ResponseEntity<List<FileVO>>(fileList, HttpStatus.OK);
			

		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	
	/*@RequestMapping(value="listFiles/{fno}", method=RequestMethod.GET)
	public void fileReadGET() throws Exception {
		
	}*/
	
	@RequestMapping(value="/listFiles/{fno}", method=RequestMethod.GET)
	public ResponseEntity<List<FileVO>> fileReadPOST(
			@PathVariable("fno") Integer fno, FileVO vo) throws Exception {
		System.out.println("path variable get");
		ResponseEntity<List<FileVO>> entity=null;

		try {
			List<String> list=new ArrayList<>();
			List<FileVO> voList=new ArrayList<>();
			vo=service.readFile(fno);
			String str=vo.getPath();
			
			File file=new File(vo.getPath());
			File[] files=file.listFiles();
			for(File f : files) {
				list.add(f.getPath());
			}
			
			Iterator<String> it=list.iterator();
			while(it.hasNext()) {
				fno=null;
				String paths=(String) it.next();
				File tempFile=new File(paths);
				vo.setFilename(tempFile.getName());
				vo.setPath(tempFile.getPath());
				
				if(tempFile.isFile()) {
					vo.setIsdir("file");
				}else if(tempFile.isDirectory()) {
					vo.setIsdir("dir");
				}
				
				service.saveFile(vo);
				System.out.println(vo.toString());
				
			}
			
			entity=new ResponseEntity<List<FileVO>>(service.selectFile(str), HttpStatus.OK);
			

			

		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		

		
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
	
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String testAjaxGET(FileVO vo) {
		System.out.println("get");
		
		return "test";
	}
	
	
	/*@RequestMapping(value="/test", method=RequestMethod.POST)
	public FileVO testAjaxPOST(FileVO vo, @RequestParam("fno") Integer fno) throws Exception {
		vo=service.readFile(fno);
		
		return vo;
	}*/
	
	
	@RequestMapping(value="/selectFile/{fno}", method=RequestMethod.GET) 
	public void selectFileGET(@PathVariable("fno") Integer fno, FileVO vo) {
		
		
		
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/selectFile/**", method=RequestMethod.POST) 
	public ResponseEntity<List<FileVO>> selectFilePOST(@RequestBody String path, FileVO vo)
	throws Exception {
		
		ResponseEntity<List<FileVO>> entity=null;
		
		String str=path.replace("\\", "\\\\");
		System.out.println(str);
		try {
			List<FileVO> fileList=new ArrayList<>();
			
			 File file=new File(str);
			 if(file != null) {

				 File[] files=file.listFiles();
				
				
				for(File f : files) {
					vo=new FileVO();
					
					vo.setFilename(f.getName());
					vo.setPath(f.getCanonicalPath());
					
					if(f.isFile()) {
						vo.setIsdir("file");
					}else if(f.isDirectory()) {
						vo.setIsdir("dir");
					}
					
					
					fileList.add(vo);
					
					

				} /*end for*/
				} /*end if*/

			 entity=new ResponseEntity<List<FileVO>>(fileList, HttpStatus.OK);

				
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);

		}finally{
			
			return entity;
		}
		
		
	}

	
}




































