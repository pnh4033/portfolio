package web.portfolio.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.ProductVO;
import web.portfolio.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger=LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	private ProductDAO dao;
	
	
	@Transactional
	@Override
	public void createProduct(ProductVO vo) throws Exception {
		
		dao.createProduct(vo);
		
		/*같이 전송된 이미지 목록 조회*/
		String[] imgs=vo.getImgs();
		logger.info("imgs : "+vo.getImgs().toString());
		
			if(imgs == null) {
				return;
			}
			
			for(String fileName : imgs) {
				fileName.replace("\"", "");
				fileName.replace("\\[", "");
				fileName.replace("\\]", "");
				
				if(fileName != null) {
					
					dao.addAttach(fileName);
					
				}
				
			}
		
	}

	
	
	@Override
	public ProductVO readProduct(Integer pno) throws Exception {
		
		return dao.readProduct(pno);
		
	}
	

	@Override
	public void modifyProduct(ProductVO vo) throws Exception {
		
		dao.modifyProduct(vo);

	}
	

	@Override
	public void removeProduct(Integer pno) throws Exception {
		
		dao.deleteProduct(pno);

	}
	

	@Override
	public List<ProductVO> listAll() throws Exception {
		
		return dao.listAll();
		
	}
	

	@Override
	public int getPno() throws Exception {
		
		return dao.getPno();
		
	}
	

	@Override
	public void addAttach(String fullName) throws Exception {
		
		dao.addAttach(fullName);
		
	}
	

	@Override
	public List<ProductVO> listCriteria(Criteria criteria) throws Exception {
		
		return dao.listCriteria(criteria);
		
	}
	

	@Override
	public int listCountCriteria(Criteria criteria) throws Exception {
		
		return dao.countPaging(criteria);
		
	}
	

	@Override
	public String getOneImg(Integer pno) throws Exception {
		
		return dao.getOneImg(pno);
		
	}
	

	@Override
	public List<String> getAllImg(Integer pno) throws Exception {
		
		return dao.getAllImg(pno);
		
	}
	

	@Override
	public String getExpdate(Integer pno) throws Exception {
		
		return dao.getExpdate(pno);
		
	}
	

	@Override
	public List<ProductVO> searchedList(Criteria criteria) throws Exception {
		
		return dao.searchedList(criteria);
		
	}
	

	@Override
	public int searchedCount(Criteria criteria) throws Exception {
		
		return dao.searchedCount(criteria);
		
	}


	@Override
	public String getCreateDate(Integer pno) throws Exception {
		
		return dao.getCreateDate(pno);
		
	}


	@Override
	public List<ProductVO> mySelling(String userID) throws Exception {
		
		return dao.mySelling(userID);
		
	}



	@Override
	public void updateNowPrice(Map map) throws Exception {
		
		dao.updateNowPrice(map);
		
	}



	@Override
	public void approachExpire() throws Exception {
		
		dao.approachExpire();
		
	}



}
