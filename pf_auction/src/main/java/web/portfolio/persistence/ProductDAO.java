package web.portfolio.persistence;

import java.util.List;

import web.portfolio.domain.ProductVO;

public interface ProductDAO {
	
	public void createProduct(ProductVO vo) throws Exception;
	public ProductVO readProduct(int pno) throws Exception;
	public void modifyProduct(ProductVO vo) throws Exception;
	public void deleteProduct(int pno) throws Exception;
	public List<ProductVO> listAll() throws Exception;
	public List<ProductVO> listPage(int page) throws Exception;
	
	public int getPno()	throws Exception;
	public void addAttach(String fullName) throws Exception;
	/*countPaging(Criteria cri) 
	public List<ProductsVO> listSearch(SearchCriteria cri) 
	public void addImg(String fullName)
	public List<String> getImg(Integer pID)
	public updateImg(String fullName, Integer pID)*/

}
