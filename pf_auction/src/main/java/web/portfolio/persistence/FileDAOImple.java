package web.portfolio.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import web.portfolio.domain.FileVO;




/////////////////
//현재 사용하지 않음 //
//개인 참고용           //
/////////////////



@Repository
public class FileDAOImple implements FileDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String NAMESPACE="web.portfolio.mapper.FileMapper.";

	@Override
	public void saveFile(FileVO vo) throws Exception {
		session.insert(NAMESPACE+"saveFile", vo);
	
	}

	@Override
	public FileVO readFile(Integer fno) throws Exception {
		return session.selectOne(NAMESPACE+"readFile", fno);
	}

	@Override
	public List<FileVO> listFile() throws Exception {
		return session.selectList(NAMESPACE+"listFile");
		
	}

	@Override
	public void deleteAll() throws Exception {
		session.delete(NAMESPACE+"deleteAll");
		
	}

	@Override
	public String readPath(Integer fno) throws Exception {
		return session.selectOne(NAMESPACE+"readPath", fno);
	}

	@Override
	public List<FileVO> selectFile(String path) throws Exception {
		return session.selectList(NAMESPACE+"selectFile", path);
	}

	@Override
	public List<String> pathList() throws Exception {
		return session.selectList(NAMESPACE+"pathList");
	}

	@Override
	public void deleteFile(Integer fno) throws Exception {
		session.delete(NAMESPACE+"deleteFile");
		
	}

	

}
