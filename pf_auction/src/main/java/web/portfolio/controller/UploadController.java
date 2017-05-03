package web.portfolio.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import web.portfolio.domain.ImgListVO;
import web.portfolio.utils.MediaUtil;
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
			String fileName="";
			MultipartFile file=null;
			Iterator<MultipartFile> it=mFile.iterator();
			List<String> list=new ArrayList<>();
			
			while(it.hasNext()) {
				
				file=it.next();
				String oriName=file.getOriginalFilename();
				System.out.println(oriName);
				byte[] imgData=file.getBytes();
				
				fileName=UploadImageUtils.uploadImg(uploadPath, oriName, imgData);
				System.out.println("fileName : "+fileName);
				/*list.add(fileName);*/
				
				
				entity=new ResponseEntity<String>(fileName, HttpStatus.CREATED);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		/*String savedName=uploadImg(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);*/
		
		return entity;
	}

	
	
	@ResponseBody
	@RequestMapping(value="/main/listImgs")
	public ResponseEntity<byte[]> listImgs(@RequestParam("fileName") String fileName) throws Exception {
		
		InputStream inputStream=null;
		ResponseEntity<byte[]> entity=null;
		
		
		try{
			/*imgList=vo.getImgList();
			Iterator<String> it=imgList.iterator();*/
			
			
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtil.getMediaType(formatName);
			HttpHeaders headers=new HttpHeaders();
			String path=uploadPath+fileName;
			path.replace("\\\\", "/");
			path.replace("\\", "/");
			System.out.println("uploadPath+fileName : "+path);
			inputStream=new FileInputStream(path);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.lastIndexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; fileName=\""+
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream)
					, headers, HttpStatus.CREATED);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			inputStream.close();
		}
		
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














