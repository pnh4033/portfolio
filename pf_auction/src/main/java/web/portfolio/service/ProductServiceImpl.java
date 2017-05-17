package web.portfolio.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.ProductVO;
import web.portfolio.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;
	
	@Transactional
	@Override
	public void createProduct(ProductVO vo) throws Exception {
		String[] imgs=vo.getImgs();
		
		dao.createProduct(vo);
		int pno=dao.getPno();
		System.out.println("pno : "+pno);
		vo.setPno(pno);
		List<String> list=new ArrayList<>();
		
		try{
	
			if(imgs == null) {
				return;
			}
			
			/*for(String fullName : imgs) {
				dao.addAttach(fullName);
			}*/
			
			
		}catch(Exception e) {
			e.printStackTrace();
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



}
