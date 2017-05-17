package utilTest;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@RestController
@RequestMapping("/test")
public class TestAjax {
	
	@SuppressWarnings("static-access")
	@Test
	public void testTime() {
		
	
	Calendar cal=Calendar.getInstance();
	Calendar cal2=new GregorianCalendar(Locale.KOREA);
	cal2.setTime(new Date());
	cal2.add(cal.DAY_OF_YEAR, 3);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd - HH:mm:ss");
	String str=sdf.format(cal2.getTime());
	System.out.println(str);

	}
}
