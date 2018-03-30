package com.mast.shop.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;





import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mast.shop.service.business.ProductService;

public class ShopTest {

	/*@Test
	public void test() {
		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");
//		String usa_now_date = sdf.format(date);
//		System.currentTimeMillis();
		System.out.println(date);
//		try {
//			Date dat=sdf.parse(usa_now_date);
//			System.out.println("-----"+dat);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}*/
	
	@Test
	public void textRandom(){
		System.out.println(random());
	}
	
	public String random() {
		String num = "1000000000";
		int min = 10000000;
		int max = 99999999;
		int random = (int)(Math.random() * (max - min) + min);
		String result=(num+random).toString();
		return result;
		
	}

}
