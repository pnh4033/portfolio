package web.portfolio.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import web.portfolio.service.ProductService;

@RestController
public class DateController {
	
	@Inject
	private ProductService service;
	
	
	@RequestMapping(value="/getExpDate", produces="application/text;charset=UTF-8")
	public ResponseEntity<String> getExpDate(Integer pno) throws Exception {
		
		ResponseEntity<String> entity=null;
		
		try{
			
			String str=service.getCreateDate(pno);
			System.out.println("createDate : "+str);

			SimpleDateFormat sdf;
			sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			Calendar cal=Calendar.getInstance();    
			Calendar calEnd=Calendar.getInstance();    
			
			Date date=sdf.parse(str);
			calEnd.setTime(date);
			
			long now=cal.getTimeInMillis();
			long end=calEnd.getTimeInMillis()+(1000*60*60*24*3);
			
			System.out.println("before : "+now);
			System.out.println("after : "+end);
			
			long diff=end-now;
			System.out.println("diff : "+diff);
			
				
			
			int day= (int)(diff/(1000*60*60*24));    
			System.out.println("day : "+day);
			
			int hour=(int)((diff / (1000*60*60)) - (24*day));    
			int hourFloor=(int) Math.floor((double)hour);
			System.out.println("hour : "+hourFloor);
			
			int minute = (int)(diff / 1000/60 - (24*60*day) - (60*hourFloor));    
			int minuteFloor=(int) Math.floor((double)minute);
			System.out.println("minute : "+minuteFloor);
			
			int second = (int)(diff / 1000 - (24*60*60*day) - (60*60*hourFloor) - (60*minuteFloor)); 
			int secondRound=Math.round(second);
			System.out.println("second : "+secondRound);
			
			String remainTime="";
			

			
			/*final int[] TIME_UNIT={3600, 60, 1};
			final String[] TIME_UNIT_NAME={"시간 ", "분 ", "초"};
			
			
			for(int i=0; i<TIME_UNIT.length; i++) {
				remainTime += diff/TIME_UNIT[i] + TIME_UNIT_NAME[i];
				diff %= TIME_UNIT[i];
			}*/
			
			
			
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
			
			System.out.println("remainTime : "+remainTime);
			
			

			
			entity=new ResponseEntity<String>(remainTime, HttpStatus.OK);
			
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}

}

















