package web.portfolio.persistence;

import java.util.List;
import java.util.Map;

import web.portfolio.domain.TenderVO;

public interface TenderDAO {
	
	public void updateNowPrice(Map map) throws Exception;         /*현재가 업데이트*/
	public Integer getMyTenderPrice(Map map) throws Exception;
	public List<Integer> myTender(String userID) throws Exception;
	
	public void addMyTender(Map map) throws Exception;
	public void updateTenderPrice(Map map) throws Exception;
}
