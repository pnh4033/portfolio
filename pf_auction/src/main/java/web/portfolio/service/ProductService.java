package web.portfolio.service;

import java.util.List;

import web.portfolio.domain.ProductVO;

public interface ProductService {
	
	public void createProduct(ProductVO vo) throws Exception;
	public ProductVO readProduct(Integer pid) throws Exception;
	public void modifyProduct(ProductVO vo) throws Exception;
	public void removeProduct(Integer pid) throws Exception;
	public List<ProductVO> listAll() throws Exception;
	/*public List<ProductVO> searchProduct(SearchCriteria scri) throws Exception;*/

}
