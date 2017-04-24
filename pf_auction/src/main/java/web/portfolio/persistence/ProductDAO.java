package web.portfolio.persistence;

import java.util.List;

import web.portfolio.domain.ProductVO;

public interface ProductDAO {
	
	public void createProduct(ProductVO vo) throws Exception;
	public ProductVO readProduct(int pid) throws Exception;
	public void modifyProduct(ProductVO vo) throws Exception;
	public void deleteProduct(int pid) throws Exception;
	public List<ProductVO> listAll() throws Exception;
	public List<ProductVO> listPage(int page) throws Exception;
	/*countPaging(Criteria cri) 
	public List<ProductsVO> listSearch(SearchCriteria cri) 
	public void addImg(String fullName)
	public List<String> getImg(Integer pID)
	public updateImg(String fullName, Integer pID)*/

}