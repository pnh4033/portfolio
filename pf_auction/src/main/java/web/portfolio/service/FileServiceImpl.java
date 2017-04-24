package web.portfolio.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.portfolio.domain.FileVO;
import web.portfolio.persistence.FileDAO;

@Service
public class FileServiceImpl implements FileService {
	
	@Inject
	private FileDAO dao;

	@Override
	public void saveFile(FileVO vo) throws Exception {
		
		try {
			dao.saveFile(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}

	@Override
	public FileVO readFile(Integer fno) throws Exception {
		
		
		return dao.readFile(fno);
	}

	@Override
	public List<FileVO> listFile() throws Exception {
		return dao.listFile();
		
	}

	@Override
	public void deleteAll() throws Exception {
		dao.deleteAll();
		
	}

	@Override
	public String readPath(Integer fno) throws Exception {
		return dao.readPath(fno);
	}

	@Override
	public List<FileVO> selectFile(String path) throws Exception {
		return dao.selectFile(path);
	}

	@Override
	public List<String> pathList() throws Exception {
		return dao.pathList();
	}

	@Override
	public void deleteFile(Integer fno) throws Exception {
		dao.deleteFile(fno);
		
	}

	
}
