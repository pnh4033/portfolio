package web.portfolio.persistence;

import java.util.List;

import web.portfolio.domain.FileVO;

public interface FileDAO {
	
	public void saveFile(FileVO vo) throws Exception;
	public List<FileVO> listFile() throws Exception;
	public FileVO readFile(Integer fno) throws Exception;
	public String readPath(Integer fno) throws Exception;
	public void deleteAll() throws Exception;

}
