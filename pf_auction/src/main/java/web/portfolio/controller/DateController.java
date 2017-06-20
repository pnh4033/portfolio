package web.portfolio.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import web.portfolio.service.ProductService;

@RestController
public class DateController {
	
	static final Logger logger=LoggerFactory.getLogger(DateController.class);
	
	@Inject
	private ProductService service;
	
	
	
	/*등록일을 계산하여 남은 시간을 반환*/
	@RequestMapping(value="/getExpDate", produces="application/text;charset=UTF-8")
	public ResponseEntity<String> getExpDate(Integer pno) throws Exception {
		
		ResponseEntity<String> entity=null;
		
		try{
			
			String str=service.getCreateDate(pno);

			SimpleDateFormat sdf;
			sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			Calendar cal=Calendar.getInstance();    
			Calendar calEnd=Calendar.getInstance();    
			
			Date date=sdf.parse(str);
			calEnd.setTime(date);
			
			
			/*시간 차이를 구하기 위해 TimeInMillis 단위로 변환*/
			long now=cal.getTimeInMillis();
			long end=calEnd.getTimeInMillis()+(1000*60*60*24*3);
			
			long diff=end-now;
			
				
			
			int day= (int)(diff/(1000*60*60*24));    
			
			int hour=(int)((diff / (1000*60*60)) - (24*day));    
			int hourFloor=(int) Math.floor((double)hour);
			
			int minute = (int)(diff / 1000/60 - (24*60*day) - (60*hourFloor));    
			int minuteFloor=(int) Math.floor((double)minute);
			
			int second = (int)(diff / 1000 - (24*60*60*day) - (60*60*hourFloor) - (60*minuteFloor)); 
			int secondRound=Math.round(second);
			
			String remainTime="";
			

			
			
			if(day > 0) {
				remainTime += day+"일 ";
			}
			
			if(hourFloor > 0) {
				remainTime += hourFloor+"시간 ";
			}
			
			if(minuteFloor > 0) {
				remainTime += minuteFloor+"분 ";
			}
			
			
			remainTime += secondRound +"초";
			
			
			if(day<=0 && hourFloor<=0 && minuteFloor<=0 && secondRound<=0) {

				remainTime="종료 되었습니다.";
			}
			
			if(str == null) {
				System.out.println("str : "+str);
				remainTime=null;
			}
			
			
			

			
			entity=new ResponseEntity<String>(remainTime, HttpStatus.OK);
			
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}

}

















