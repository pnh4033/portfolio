package web.portfolio.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import web.portfolio.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	private static final String NAMESPACE="web.portfolio.mapper.ProductMapper.";
	
	@Inject 
	SqlSession session;

	@Override
	public void createProduct(ProductVO vo) throws Exception {
		session.insert(NAMESPACE+"createProduct", vo);

	}

	@Override
	public ProductVO readProduct(int pno) throws Exception {
		return session.selectOne(NAMESPACE+"read", pno);
	}

	@Override
	public void modifyProduct(ProductVO vo) throws Exception {
		session.update(NAMESPACE+"update", vo);

	}
	
	@Transactional
	@Override
	public void deleteProduct(int pno) throws Exception {
		session.delete(NAMESPACE+"delete", pno);

	}

	@Override
	public List<ProductVO> listAll() throws Exception {
		return session.selectList(NAMESPACE+"listAll");
	}

	@Override
	public List<ProductVO> listPage(int page) throws Exception {
		
		if(page<=0) page=1;
		page=(page-1)*10;
		
		return session.selectList(NAMESPACE+"listPage", page);
	}



	@Override
	public int getPno() throws Exception {
		return session.selectOne(NAMESPACE+"getPno");
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		session.insert(NAMESPACE+"addAttach", fullName);
		
	}

}











