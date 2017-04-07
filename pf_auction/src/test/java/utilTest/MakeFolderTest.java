package utilTest;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.portfolio.utils.MakeFolder;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MakeFolderTest {
	
	private static final Logger logger=LoggerFactory
			.getLogger(MakeFolder.class);
	
	List<Map> listMap=new ArrayList<>();
    Map<List, String> fileList=new HashMap<>();
    
    
    String path="c:\\";
    String addPath;
    
    

    
	@Test
	public void readFolder(String path) {
		
		
		List<String> dirName=new ArrayList<>();
		List<String> fileName=new ArrayList<>();
		
		File file=new File(path);
		
		if(!file.exists() || !file.isDirectory()) {
			logger.info("no validation");
			return;
		}
		
		File[] files=file.listFiles();
		
		for(int i=0; i < files.length; i++) {
			String fName=files[i].getName();
			
			
			if(files[i].isDirectory()) {
				
				String str="";
				str=fName;
				
				dirName.add(str);
				
			
			} else {
			
				fileName.add(fName);
				
				fName="";
				
			}
			
		}

		    fileList.put(dirName, "folder");
			fileList.put(fileName, "file");
			
			System.out.println(fileList.toString());
			
			
			Set<Entry<List, String>> set=fileList.entrySet();
			Iterator<Entry<List, String>> it=set.iterator();
			
			while(it.hasNext()) {
				Map.Entry<List, String> e=it.next();
				
				if(e.getValue().equals("folder")) {
					addPath=path + File.separator + e.getKey();
					
					readFolder(addPath);
					
				}
			}

			
			

			/*listMap.add(fileList);*/
			

		
	}
	


}











