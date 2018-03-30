package com.mast.shop.tools;

public class RandomTool {
	public static String orderCode() {
		String num = "1000000000";
		int min = 10000000;
		int max = 99999999;
		int random = (int) (Math.random() * (max - min) + min);
		String result = (num + random).toString();
		return result;
	}
}
