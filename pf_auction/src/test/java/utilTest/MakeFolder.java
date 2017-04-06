package utilTest;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MakeFolder {
	
	private static final Logger logger=LoggerFactory.getLogger(MakeFolder.class);
	
	Map<String, String> folder=new HashMap<>();
	
	@Test
	public void readFolder() {
		
		File file=new File("c:\\");
		
		if(!file.exists() || !file.isDirectory()) {
			logger.info("no validation.");
			return;
		}
		
		File[] files=file.listFiles();
		
		for(int i=0; i < files.length; i++) {
			String fileName=files[i].getName();
			
			if(files[i].isDirectory()) {
				logger.info("[" + fileName + "]");
			}else{
				logger.info(fileName);
			}
		}
		
	}

}











