package web.portfolio.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import web.portfolio.domain.TenderVO;
import web.portfolio.persistence.TenderDAO;

@Service
public class TenderServiceImpl implements TenderService {
	
    private static final Logger logger=LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private TenderDAO dao;
	

	@Override
	public void updateNowPrice(Map map) throws Exception {
		
		dao.updateNowPrice(map);
		
	}

	@Override
	public Integer getMyTenderPrice(Map map) throws Exception {
		
		return dao.getMyTenderPrice(map);
		
	}

	@Override
	public List<Integer> myTender(String userID) throws Exception {
		
		return dao.myTender(userID);
		
	}

	@Override
	public void addMyTender(Map map) throws Exception {
		
		dao.addMyTender(map);
		
	}

	@Override
	public void updateTenderPrice(Map map) throws Exception {
		
		dao.updateTenderPrice(map);
		
	}

}
