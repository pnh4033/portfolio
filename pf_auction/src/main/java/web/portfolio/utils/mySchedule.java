package web.portfolio.utils;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

import web.portfolio.service.ProductService;

public class mySchedule {
	
private static final Logger logger=LoggerFactory.getLogger(mySchedule.class);
	
	
	@Inject
	private ProductService prod_service;
	
	
	/*종료된 경매 처리*/
	@Scheduled(cron="*/1 * * * * *")
	public void scdTest() throws Exception {
		

		
		try {
			
			prod_service.approachExpire();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}

		
	}

	
	
	
	
	
}
