package web.portfolio.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadImageUtils {
	
	
	private static final Logger logger=LoggerFactory.getLogger(UploadImageUtils.class);
	
	
	
	public static String uploadImg(String uploadPath, String oriName, byte[] imgData)
			throws Exception {
		
		/*유니크 파일명 생성*/
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+oriName;
		String savedPath=calcPath(uploadPath);
		
		
		File targetImg=new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(imgData, targetImg);
		
		/*파일 포맷 추출*/
		String fmtName=oriName.substring(oriName.lastIndexOf(".")+1);
		
		String uploadedImgName=null;
		
		if(MediaUtil.getMediaType(fmtName) != null) {
			
			/*썸네일 생성후 반환된 경로명*/
			uploadedImgName=makeThumbnail(uploadPath, savedPath, savedName);
			
		}
		
		return uploadedImgName;
		
	}
	
	
	
	
	/*날짜에 의한 경로 생성*/
	private static String calcPath(String uploadPath) {
		
		Calendar cal=Calendar.getInstance();
		
		String yearDir=File.separator + cal.get(Calendar.YEAR);
		String monthDir=yearDir + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String dateDir=monthDir + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearDir, monthDir, dateDir);
		
		logger.info(dateDir);
		
		return dateDir;
		
	}
	
	
	
	
	private static void  makeDir(String uploadPath, String...paths) {
	
		/*경로가 이미 존재하는지 확인*/
		if(new File(paths[paths.length-1]).exists()) {
			
			return;
			
		}
		
		
		for(String path : paths) {
			
			File directory=new File(uploadPath + path);
			
			if(!directory.exists()) {
				directory.mkdirs();
			}
			
		}
		
		
	}
	
	
	
	
	/*썸네일 생성*/
	private static String makeThumbnail(String uploadPath, String path, String fileName)
			throws Exception {
		
		BufferedImage sourceImg=ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg=Scalr.resize(
				sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 150);
		
		/*썸네일 이미지는 파일명 앞에 's_' 로 시작*/
		String thumbnailName=uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile= new File(thumbnailName);
		
		/*파일 포맷 추출*/
		String fmtName=fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, fmtName.toUpperCase(), newFile);
		
		
		/*저장된 썸네일 경로 반환*/
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	

}













