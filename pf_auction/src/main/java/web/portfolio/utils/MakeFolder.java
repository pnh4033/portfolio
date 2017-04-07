package web.portfolio.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MakeFolder {
	
	private static final Logger logger=LoggerFactory
			.getLogger(MakeFolder.class);
	
	List<Map> listMap=new ArrayList<>();
    Map<List, String> fileListMap=new HashMap<>();
    
    Map dirList=new HashMap<>();
    
    
    String path="c:\\";
    String addPath;
    
   
    
	public Map<List, String> readFolder(String path) {
		
		
		List<String> dirName=new ArrayList<>();
		List<String> fileName=new ArrayList<>();
		
		File file=new File(path);
		
		if(!file.exists() || !file.isDirectory()) {
			logger.info("no validation");
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

		    fileListMap.put(dirName, "folder");
			fileListMap.put(fileName, "file");
			
			logger.info(fileListMap.toString());
			
			
			/*Set<Entry<List, String>> folderList=fileListMap.entrySet();
			
			Iterator<Entry<List, String>> it=folderList.iterator();
			
			while(it.hasNext()) {
				Map.Entry<List, String> e=it.next();
				
				if(e.getValue().equals("folder")) {
					addPath=path + File.separator + e.getKey();
					
					String fName="[" + e.getKey() + "]";
					
				}
				
				
			}*/

			return fileListMap;
			


		
	}

}










