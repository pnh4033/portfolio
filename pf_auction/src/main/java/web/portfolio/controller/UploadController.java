package web.portfolio.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.portfolio.utils.UploadImageUtils;

@RestController
public class UploadController {
	
	private static final Logger logger=LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/main/upload", method=RequestMethod.GET)
	public void upload() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/main/upload", method=RequestMethod.POST)
	public ResponseEntity<String> upload(@RequestPart List<MultipartFile> mFile) throws Exception {
		
		ResponseEntity<String> entity=null;
		System.out.println(mFile.toString());
		
		try{
			
			Iterator<MultipartFile> it=mFile.iterator();
			MultipartFile file;
			
			while(it.hasNext()) {
				file=it.next();
				String oriName=file.getOriginalFilename();
				System.out.println(oriName);
				byte[] imgData=file.getBytes();
				
				UploadImageUtils.uploadImg(uploadPath, oriName, imgData);
			}
			
			/*String oriName=mFile.getOriginalFilename();
			System.out.println(oriName);
			byte[] imgData=mFile.getBytes();*/
			
			/*String path = "C:\\image"+File.separator;
	          InputStream inputStream = null;
	          OutputStream outputStream = null;
	          
	          String organizedfilePath="";
	          
	          try {
	              
	 
	              if (mFile.getSize() > 0) {
	                  inputStream = mFile.getInputStream();
	                  File realUploadDir = new File(path);
	                  
	                  if (!realUploadDir.exists()) {//업로드하려는 path에 폴더가 없을경우
	                      realUploadDir.mkdirs();//폴더생성.
	                  }
	                  
	                  
	                  organizedfilePath = path + UUID.randomUUID() + "_" + mFile.getOriginalFilename();
	                  System.out.println(organizedfilePath);//파일이 저장된경로 + 파일 명
	                  
	                  outputStream = new FileOutputStream(organizedfilePath);
	 
	                  int readByte = 0;
	                  byte[] buffer = new byte[8192];
	 
	                  while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
	                      outputStream.write(buffer, 0, readByte); //파일 생성 ! 
	                      
	                  }
	            
	                  
	              }
	              
	          } catch (Exception e) {
	              e.printStackTrace();
	 
	          } finally {
	 
	              outputStream.close();
	              inputStream.close();
	          }*/
			
			
			/*UploadImageUtils.uploadImg(uploadPath, oriName, imgData);

			String result=uploadPath+File.separator+oriName;	
			System.out.println(result);*/
			

			
			entity=new ResponseEntity<String>(HttpStatus.CREATED);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		/*String savedName=uploadImg(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);*/
		
		return entity;
	}
	
	
	
	private String uploadImg(String oriName, byte[] imgData) throws Exception {
		
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString() + "_" + oriName;
		
		File target=new File(uploadPath, savedName);
		FileCopyUtils.copy(imgData, target);
		
		return savedName;
	}

}














