package web.portfolio.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import web.portfolio.domain.TenderVO;

@Repository
public class TenderDAOImpl implements TenderDAO {
	
    private static final String NAMESPACE="web.portfolio.mapper.TenderMapper.";
	
	
	@Inject 
	SqlSession session;

	
	
	@Override
	public void updateNowPrice(Map map) throws Exception {
		
		session.update(NAMESPACE+"updateNowPrice", map);
		
	}



	@Override
	public Integer getMyTenderPrice(Map map) throws Exception {
		
		return session.selectOne(NAMESPACE+"getMyTenderPrice", map);
		
	}



	@Override
	public List<Integer> myTender(String userID) throws Exception {
		
		return session.selectList(NAMESPACE+"myTender", userID);
	}



	@Override
	public void addMyTender(Map map) throws Exception {
		
		session.insert(NAMESPACE+"addMyTender", map);
		
	}



	@Override
	public void updateTenderPrice(Map map) throws Exception {
		
		session.update(NAMESPACE+"updateTenderPrice", map);
		
	}



}
