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
	public ProductVO readProduct(int pID) throws Exception {
		return session.selectOne(NAMESPACE+"read", pID);
	}

	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		session.update(NAMESPACE+"update", vo);

	}
	
	@Transactional
	@Override
	public void deleteProduct(int pID) throws Exception {
		session.delete(NAMESPACE+"delete", pID);

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

}











