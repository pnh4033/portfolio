package web.portfolio.service;

import java.util.List;

import web.portfolio.domain.FileVO;



/////////////////
//현재 사용하지 않음 //
//개인 참고용           //
/////////////////


public interface FileService {
	
	public void saveFile(FileVO vo) throws Exception;
	public List<FileVO> listFile() throws Exception;
	public List<FileVO> selectFile(String path) throws Exception;
	public FileVO readFile(Integer fno) throws Exception;
	public String readPath(Integer fno) throws Exception;
	public void deleteFile(Integer fno) throws Exception;
	public List<String> pathList() throws Exception;
	public void deleteAll() throws Exception;
	
	

}
