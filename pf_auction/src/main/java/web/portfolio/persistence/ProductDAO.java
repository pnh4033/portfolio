package web.portfolio.persistence;

import java.util.List;
import java.util.Map;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.ProductVO;

public interface ProductDAO {
	
	public void createProduct(ProductVO vo) throws Exception;        /*상품 등록*/
	public ProductVO readProduct(int pno) throws Exception;          /*등록된 상품 조회*/ 
	public void modifyProduct(ProductVO vo) throws Exception;        /*등록된 상품 수정*/
	public void deleteProduct(int pno) throws Exception;             /*등록된 상품 삭제*/
	
	public List<ProductVO> listAll() throws Exception;
	public List<ProductVO> listPage(int page) throws Exception;
	public List<ProductVO> listCriteria(Criteria criteria) throws Exception;     /*페이징, 검색 키워드 를 이용한 상품 리스트*/
	
	public int getPno()	throws Exception;
	public void addAttach(String fullName) throws Exception;          /*이미지 첨부*/  
	public int countPaging(Criteria criteria) throws Exception;       
	public String getOneImg(Integer pno) throws Exception;            /*샘플 이미지 한개 가져오기*/
	public List<String> getAllImg(Integer pno) throws Exception;      /*첨부된 이미지 리스트*/
	public String getExpdate(Integer pno) throws Exception;           /*종료일 조회*/ 
	public String getCreateDate(Integer pno) throws Exception;
	
	public List<ProductVO> searchedList(Criteria criteria) throws Exception;
	public int searchedCount(Criteria criteria) throws Exception;
	
	public List<ProductVO> mySelling(String userID) throws Exception;        /*내가 등록한 상품들 조회*/
	
	public void updateNowPrice(Map map) throws Exception;         /*현재가 업데이트*/
	

}
