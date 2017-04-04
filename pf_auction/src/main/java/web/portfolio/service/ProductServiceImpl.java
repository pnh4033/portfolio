package web.portfolio.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.portfolio.domain.ProductVO;
import web.portfolio.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;

	@Override
	public void createProduct(ProductVO vo) throws Exception {
		dao.createProduct(vo);

	}

	@Override
	public ProductVO readProduct(Integer pid) throws Exception {
		return dao.readProduct(pid);
	}

	@Override
	public void modifyProduct(ProductVO vo) throws Exception {
		dao.modifyProduct(vo);

	}

	@Override
	public void removeProduct(Integer pid) throws Exception {
		dao.deleteProduct(pid);

	}

	@Override
	public List<ProductVO> listAll() throws Exception {
		return dao.listAll();
	}

}
