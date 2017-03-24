package web.portfolio.testDAO;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.portfolio.domain.ProductVO;
import web.portfolio.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TestDB {
	
	@Inject
	private ProductDAO dao;
	
	@Test
	public void testDB() throws Exception {
		ProductVO vo=new ProductVO();
		vo.setTitle("test title 입니다.");
		vo.setI_price(4999999);
		vo.setStartprice(50000);
		vo.setQuantity(300000);
		vo.setBuytype("auction");
		
		dao.createProduct(vo);
	}

}
