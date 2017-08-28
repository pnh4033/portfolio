package web.portfolio.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import web.portfolio.domain.Criteria;
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
		
		return session.selectOne(NAMESPACE+"readProduct", pno);
		
	}

	
	@Override
	public void modifyProduct(ProductVO vo) throws Exception {
		
		session.update(NAMESPACE+"update", vo);

	}
	
	
	@Transactional
	@Override
	public void removeProduct(int pno) throws Exception {
		
		session.delete(NAMESPACE+"removeProduct", pno);

	}
	

	@Override
	public List<ProductVO> listAll() throws Exception {
		
		return session.selectList(NAMESPACE+"listAll");
		
	}
	

	@Override
	public List<ProductVO> listPage(int page) throws Exception {
		
		if(page<=0) page=1;
		page=(page-1)*20;
		
		return session.selectList(NAMESPACE+"listPage", page);
		
	}


	@Override
	public int getPno() throws Exception {
		
		return session.selectOne(NAMESPACE+"getPno");
		
	}

	
	@Override
	public void addAttach(String fullName) throws Exception {
		
		if(fullName != null) {
			
			session.insert(NAMESPACE+"addAttach", fullName);
			
		}
		
	}
	

	@Override
	public List<ProductVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(NAMESPACE+"listCriteria", cri);
		
	}

	
	@Override
	public int countPaging(Criteria criteria) throws Exception {
		
		return session.selectOne(NAMESPACE+"countPaging", criteria);
		
	}
	

	@Override
	public String getOneImg(Integer pno) throws Exception {
		
		return session.selectOne(NAMESPACE+"getOneImg", pno);
		
	}

	
	@Override
	public List<String> getAllImg(Integer pno) throws Exception {
		
		return session.selectList(NAMESPACE+"getAllImg", pno);
		
	}

	
	@Override
	public String getExpdate(Integer pno) throws Exception {
		
		return session.selectOne(NAMESPACE+"getExpdate", pno);
		
	}
	

	@Override
	public List<ProductVO> searchedList(Criteria criteria) throws Exception {
		
		return session.selectList(NAMESPACE+"searchedList", criteria);
		
	}

	
	@Override
	public int searchedCount(Criteria criteria) throws Exception {
		
		return session.selectOne(NAMESPACE+"searchedCount");
		
	}

	
	@Override
	public String getCreateDate(Integer pno) throws Exception {
		
		return session.selectOne(NAMESPACE+"getCreateDate", pno);
		
	}
	

	@Override
	public List<ProductVO> mySelling(String userID) throws Exception {
		
		return session.selectList(NAMESPACE+"mySelling", userID);
		
	}


	@Override
	public void updateNowPrice(Map map) throws Exception {
		

		
		session.update(NAMESPACE+"updateNowPrice", map);
		
	}


	@Override
	public void approachExpire() throws Exception {

		session.update(NAMESPACE+"approachExpire");
		
	}


	@Override
	public void removeAttach(Integer pno) throws Exception {
		
		session.delete(NAMESPACE+"removeAttach", pno);
		
	}


	@Override
	public void updateAttach(Map map) throws Exception {
		
		session.insert(NAMESPACE+"updateAttach", map);
		
	}


	@Override
	public ProductVO getUserInfo(String id) throws Exception {
		
		return session.selectOne(NAMESPACE+"getUserInfo", id);
	}


	@Override
	public void modifyPrice(Map map) throws Exception {
		
		session.update(NAMESPACE+"modifyPrice", map);
		
	}


	@Override
	public String isExpired(Integer pno) throws Exception {
		
		return session.selectOne(NAMESPACE+"isExpired", pno);
		
	}


	@Override
	public void addMyFavorite(Map map) throws Exception {
		
		session.insert(NAMESPACE+"addMyFavorite", map);
		
	}


	@Override
	public void removeMyFavorite(Map map) throws Exception {
		
		session.delete(NAMESPACE+"removeMyFavorite", map);
		
	}


	@Override
	public List<Integer> readMyFavorite(String userID) throws Exception {
		
		return session.selectList(NAMESPACE+"readMyFavorite", userID);
	}

}











