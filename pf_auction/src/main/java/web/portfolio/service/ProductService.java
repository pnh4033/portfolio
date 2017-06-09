package web.portfolio.service;

import java.util.Date;
import java.util.List;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.ProductVO;

public interface ProductService {
	
	public void createProduct(ProductVO vo) throws Exception;
	public ProductVO readProduct(Integer pno) throws Exception;
	public void modifyProduct(ProductVO vo) throws Exception;
	public void removeProduct(Integer pno) throws Exception;
	public List<ProductVO> listAll() throws Exception;
	public int getPno() throws Exception;
	public void addAttach(String fullName) throws Exception;
	public List<ProductVO> listCriteria(Criteria criteria) throws Exception;
	public int listCountCriteria(Criteria criteria) throws Exception;
	public String getOneImg(Integer pno) throws Exception;
	public List<String> getAllImg(Integer pno) throws Exception;
	public String getExpdate(Integer pno) throws Exception;
	public String getCreateDate(Integer pno) throws Exception;
    
	public List<ProductVO> searchedList(Criteria criteria) throws Exception;
	public int searchedCount(Criteria criteria) throws Exception;
	
	public List<ProductVO> mySelling(String userID) throws Exception;
}
