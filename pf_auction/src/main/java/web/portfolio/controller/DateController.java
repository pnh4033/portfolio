package web.portfolio.controller;

import java.net.URLEncoder;
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
			
			String str=service.getExpdate(pno);
			System.out.println("enddate : "+str);

			SimpleDateFormat sdf;
			sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			Calendar cal=Calendar.getInstance();    /*현재시간*/
			Calendar calEnd=Calendar.getInstance();    /*종료시간*/
			
			Date date=sdf.parse(str);
			calEnd.setTime(date);
			
			long now=cal.getTimeInMillis();
			long end=calEnd.getTimeInMillis();
			
			System.out.println("before : "+now);
			System.out.println("after : "+end);
			
			long val=end-now;
			System.out.println("val : "+val);
			
			int day= (int)(val/(1000*60*60*24));    /*남은 일 수*/
			System.out.println("day : "+day);
			
			int hour=(int)((val / (1000*60*60)) - (24*day));    /*남은 시간*/
			int hourFloor=(int) Math.floor((double)hour);
			System.out.println("hour : "+hourFloor);
			
			int minute = (int)(val / 1000/60 - (24*60*day) - (60*hourFloor));    /*남은 분*/
			int minuteFloor=(int) Math.floor((double)minute);
			System.out.println("minute : "+minuteFloor);
			
			int second = (int)(val / 1000 - (24*60*60*day) - (60*60*hourFloor) - (60*minuteFloor)); /*남은 초*/
			int secondRound=Math.round(second);
			System.out.println("second : "+secondRound);
			
			
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
			
			System.out.println("remainTime : "+remainTime);
			
			
			
			
			entity=new ResponseEntity<String>(remainTime, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}

}

















